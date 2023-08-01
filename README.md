# fe7_us

This is a disassembly/decompilation of "Fire Emblem" (US) for the GameBoy Advance, also referred to as "Fire Emblem: The Blazing Blade" in modern official media.

It builds the following ROM:

* **[fe7_us.gba][no-intro]** `sha1: c735fdbb9e8abe19e0c6a44708df19acc962e204`

For now, this is primarily meant as a modding and research reference. [fireemblem8u][fireemblem8u] or [fe6][fe6] should be prioritized regarding actual exhaustive decompilation efforts.

[no-intro]: https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=1216
[fireemblem8u]: https://github.com/FireEmblemUniverse/fireemblem8u
[fe6]: https://github.com/StanHash/fe6

# Set up

On Debian/Ubuntu (including WSL2).

Get a copy of a FE7(US) dump, name it baserom.gba and put it in this root folder.

Install prereqs:

```bash
sudo apt install build-essential gcc-arm-none-eabi
tools/install_agbcc.sh
```

`make`

## Contributing

Feel free.

## See also

* [**StanHash/fe1**](https://github.com/StanHash/fe1), a disassembly of Fire Emblem: Ankoku Ryu to Hikari no Tsurugi (dormant)
* [**ZaneAvernathy/FireEmblem5**](https://github.com/ZaneAvernathy/FireEmblem5), a disassembly of Fire Emblem: Thracia 776
* [**StanHash/fe6**](https://github.com/StanHash/fe6), a decompilation of Fire Emblem: Fūin no Tsurugi
* [**MokhaLeee/FireEmblem7J**](https://github.com/MokhaLeee/FireEmblem7J), a decompilation of Fire Emblem: Rekka no Ken (JP)
* [**FireEmblemUniverse/fireemblem8u**](https://github.com/FireEmblemUniverse/fireemblem8u), a decompilation of Fire Emblem: The Sacred Stones (US)

## Contact

You can find me over at the [Fire Emblem Universe Discord](https://feuniverse.us/t/feu-discord-server/1480?u=stanh) under the handle `nat_776`.
