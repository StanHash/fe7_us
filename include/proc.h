#ifndef PROC_H
#define PROC_H

#include "prelude.h"

#define PROC_COUNT 0x40

typedef void Proc;
typedef void ProcConsumer(Proc * proc);

struct ProcScr
{
    i16 cmd;
    i16 imm;
    void const * ptr;
};

enum
{
    PROC_CMD_END,
    PROC_CMD_NAME,
    PROC_CMD_CALL,
    PROC_CMD_REPEAT,
    PROC_CMD_ONEND,
    PROC_CMD_START_CHILD,
    PROC_CMD_START_CHILD_BLOCKING,
    PROC_CMD_START_BUGGED,
    PROC_CMD_WHILE_EXISTS,
    PROC_CMD_END_EACH,
    PROC_CMD_BREAK_EACH,
    PROC_CMD_LABEL,
    PROC_CMD_GOTO,
    PROC_CMD_GOTO_SCR,
    PROC_CMD_SLEEP,
    PROC_CMD_MARK,
    PROC_CMD_BLOCK,
    PROC_CMD_END_IF_DUP,
    PROC_CMD_SET_FLAG2,
    PROC_CMD_13,
    PROC_CMD_WHILE,
    PROC_CMD_15,
    PROC_CMD_CALL_2,
    PROC_CMD_END_DUPS,
    PROC_CMD_CALL_ARG,
    PROC_CMD_19,
};

// clang-format off

#define PROC_END                          { PROC_CMD_END, 0, 0 }
#define PROC_NAME(name_str)               { PROC_CMD_NAME, 0, (name_str) }
#define PROC_CALL(func)                   { PROC_CMD_CALL, 0, (func) }
#define PROC_REPEAT(func)                 { PROC_CMD_REPEAT, 0, (func) }
#define PROC_ONEND(func)                  { PROC_CMD_ONEND, 0, (func) }
#define PROC_START_CHILD(procscr)         { PROC_CMD_START_CHILD, 0, (procscr) }
#define PROC_START_CHILD_LOCKING(procscr) { PROC_CMD_START_CHILD_BLOCKING, 1, (procscr) }
#define PROC_START_BUGGED(procscr)        { PROC_CMD_START_BUGGED, 0, (procscr) }
#define PROC_WHILE_EXISTS(procscr)        { PROC_CMD_WHILE_EXISTS, 0, (procscr) }
#define PROC_END_EACH(procscr)            { PROC_CMD_END_EACH, 0, (procscr) }
#define PROC_BREAK_EACH(procscr)          { PROC_CMD_BREAK_EACH, 0, (procscr) }
#define PROC_LABEL(label)                 { PROC_CMD_LABEL, (label), 0 }
#define PROC_GOTO(label)                  { PROC_CMD_GOTO, (label), 0 }
#define PROC_GOTO_SCR(procscr)            { PROC_CMD_GOTO_SCR, 0, (procscr) }
#define PROC_SLEEP(duration)              { PROC_CMD_SLEEP, (duration), 0 }
#define PROC_MARK(mark)                   { PROC_CMD_MARK, (mark), 0 }
#define PROC_BLOCK                        { PROC_CMD_BLOCK, 0, 0 }
#define PROC_END_IF_DUP                   { PROC_CMD_END_IF_DUP, 0, 0 }
#define PROC_SET_FLAG2                    { PROC_CMD_SET_FLAG2, 0, 0 }
#define PROC_13                           { PROC_CMD_13, 0, 0 }
#define PROC_WHILE(func)                  { PROC_CMD_WHILE, 0, (func) }
#define PROC_15                           { PROC_CMD_15, 0, 0 }
#define PROC_CALL_2(func)                 { PROC_CMD_CALL_2, 0, (func) }
#define PROC_END_DUPS                     { PROC_CMD_END_DUPS, 0, 0 }
#define PROC_CALL_ARG(func, arg)          { PROC_CMD_CALL_ARG, (arg), (func) }
#define PROC_19                           { PROC_CMD_19, 0, 0 }

// clang-format on

#define PROC_HEADER                                                                                                    \
    /* 00 */ struct ProcScr const * proc_script;    /* pointer to start of proc script */                              \
    /* 04 */ struct ProcScr const * proc_script_pc; /* pointer to current script command */                            \
    /* 08 */ ProcConsumer * proc_end_func;          /* func to run when the proc ends */                               \
    /* 0C */ ProcConsumer * proc_repeat_func;       /* func to run every frame. suspends script execution */           \
    /* 10 */ char const * proc_name;                /* proc name (used for debugging) */                               \
    /* 14 */ Proc * proc_parent;                    /* parent proc. If this proc is a root proc, */                    \
                                                    /* this member is an integer which is the tree index. */           \
    /* 18 */ Proc * proc_child;                     /* pointer to head (most recent) child */                          \
    /* 1C */ Proc * proc_next;                      /* next sibling */                                                 \
    /* 20 */ Proc * proc_prev;                      /* previous sibling */                                             \
    /* 24 */ i16 proc_sleep_clock;                                                                                     \
    /* 26 */ u8 proc_mark;                                                                                             \
    /* 27 */ u8 proc_flags;                                                                                            \
    /* 28 */ u8 proc_lock_cnt /* wait lock. execution is suspended while this is nonzero. */

#define PROC_TREE_COUNT 8

#define PROC_TREE_VSYNC ((Proc *)0)
#define PROC_TREE_1 ((Proc *)1)
#define PROC_TREE_2 ((Proc *)2)
#define PROC_TREE_3 ((Proc *)3)
#define PROC_TREE_4 ((Proc *)4)
#define PROC_TREE_5 ((Proc *)5)
#define PROC_TREE_6 ((Proc *)6)
#define PROC_TREE_7 ((Proc *)7)

extern Proc * gProcTreeRoots[PROC_TREE_COUNT];

#endif // PROC_H
