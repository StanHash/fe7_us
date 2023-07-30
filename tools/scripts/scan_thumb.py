# this was used to generate an exhaustive list of the games compiled code
# it's good at scanning agbcc-compiled thumb code

def read_int(bytes: bytes, offset: int, length: int):
    return int.from_bytes(bytes[offset:offset+length], 'little')

DEBUG = False

THM_LSLS_2_MASK = 0xFFC0 # 1111 1111 1100 0000
THM_LSLS_2_BITS = 0x0080 # 0000 0000 1000 0000

THM_LDR_PC_MASK = 0xF800 # 1111 1000 0000 0000
THM_LDR_PC_BITS = 0x4800 # 0100 1000 0000 0000

THM_ADDS_R_MASK = 0xFE00 # 1111 1110 0000 0000
THM_ADDS_R_BITS = 0x1800 # 0001 1000 0000 0000

THM_LDR_0_MASK = 0xFFC0 # 1111 1111 1100 0000
THM_LDR_0_BITS = 0x6800 # 0110 1000 0000 0000

THM_MOV_PC_MASK = 0xFF87 # 1111 1111 1000 0111
THM_MOV_PC_BITS = 0x4687 # 0100 0110 1xxx x111

THM_BX_MASK = 0xFF87 # 1111 1111 1000 0111
THM_BX_BITS = 0x4700 # 0100 0111 0xxx x000

def get_ldr_pc_literal_off(opcode_off: int, opcode: int) -> int:
    return ((opcode_off + 4) & ~2) + ((opcode & 0x00FF) * 4)

class SwitchMachine:
    def __init__(self) -> None:
        self.state = 0
        self.pooled_addr = 0

    def consume(self, addr: int, opcode: int) -> int | None:
        state = self.state
        self.state = 0

        if state == 0:
            # lsls rx, rx, 2
            if (opcode & THM_LSLS_2_MASK) == THM_LSLS_2_BITS:
                self.state = 1

        elif state == 1:
            # ldr rx, [pc, x]
            if (opcode & THM_LDR_PC_MASK) == THM_LDR_PC_BITS:
                self.state = 2
                self.pooled_addr = get_ldr_pc_literal_off(addr, opcode)

        elif state == 2:
            # add rX, rX, rX
            if (opcode & THM_ADDS_R_MASK) == THM_ADDS_R_BITS:
                self.state = 3

        elif state == 3:
            # ldr rX, [rX]
            if (opcode & THM_LDR_0_MASK) == THM_LDR_0_BITS:
                self.state = 4

        elif state == 4:
            # mov pc, rX
            if (opcode & THM_MOV_PC_MASK) == THM_MOV_PC_BITS:
                return self.pooled_addr

        if DEBUG and self.state != 0:
            print(f"at {addr:08X}: state {self.state}")

        return None

def parse_asm_names(path: str) -> dict[int, str]:
    import re

    re_line = re.compile(r'fun 0x(?P<addr>[0-9A-F]+), (?P<name>[a-zA-Z_][a-zA-Z0-9_]*)')

    result = {}

    with open(path, 'r') as f:
        for line in f.readlines():
            m = re_line.match(line)

            if m != None:
                addr = int(m.group('addr'), base = 16) & ~1
                name = m.group('name')

                result[addr] = name

    return result

def main(args):
    try:
        rom_path = args[1]
        beg_off = int(args[2], base = 0) & 0x1FFFFFF
        end_off = int(args[3], base = 0) & 0x1FFFFFF
        asm_path = args[4] if len(args) > 4 else None

    except IndexError:
        return f"Usage: [python 3] {args[0]} ROM BEGIN END [ASM REFERENCE]"

    with open(rom_path, 'rb') as f:
        rom = f.read()

    names = {}

    if asm_path != None:
        names = parse_asm_names(asm_path)

    next_is_func = True
    next_ldr_pool_beg = end_off
    next_ldr_pool_end = -1

    offset = beg_off

    switch_machine = SwitchMachine()

    while offset < end_off:
        # literal pool skip
        if offset >= next_ldr_pool_beg:
            if offset < next_ldr_pool_end:
                offset = next_ldr_pool_end

            next_ldr_pool_beg = end_off
            next_ldr_pool_end = -1

            continue

        # we are at the next func (last insn was bx)
        if next_is_func and (offset & 3) == 0:
            addr = offset + 0x08000000

            if addr in names:
                print(f"thumb_func 0x{addr:08X} {names[addr]}")
            else:
                print(f"thumb_func 0x{addr:08X}")

            next_is_func = False

        opcode = read_int(rom, offset, 2)

        # advance switch state machine
        pooled_switch_offset = switch_machine.consume(offset, opcode)

        # we are at a jump table, skip the jump table
        if pooled_switch_offset != None:
            switch_offset = read_int(rom, pooled_switch_offset, 4) & 0x01FFFFFF

            if DEBUG:
                print(f"switch_offset: {switch_offset:08X}")

            next_offset = end_off

            while switch_offset < next_offset:
                jump_offset = read_int(rom, switch_offset, 4) & 0x01FFFFFE

                if jump_offset > offset:
                    next_offset = min(jump_offset, next_offset)

                switch_offset = switch_offset + 4

                if DEBUG:
                    print(f"jump_offset: {jump_offset:08X}")
                    print(f"next_offset: {next_offset:08X}")
                    print(f"switch_offset: {switch_offset:08X}")

            offset = next_offset

        # a ldr [pc] == literal load
        if (opcode & THM_LDR_PC_MASK) == THM_LDR_PC_BITS:
            ldr_lit_off = get_ldr_pc_literal_off(offset, opcode)

            next_ldr_pool_beg = min(next_ldr_pool_beg, ldr_lit_off)
            next_ldr_pool_end = max(next_ldr_pool_end, ldr_lit_off + 4)

        # a bx == end of func
        if (opcode & THM_BX_MASK) == THM_BX_BITS:
            next_is_func = True

        # goto next instruction
        offset = offset + 2

    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
