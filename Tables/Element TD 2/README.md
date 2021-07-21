# Element TD 2
| Information | Value |
| :---------- | :---- |
| Edition     | Steam |
| Version     | 1.1.4 |

## Player Stats
- Possible injection point at `8B 81 04 01 00 00 03 81 00 01 00 00 C3` (`Game.GetEssenceGained`)
    - Executes every game tick
    - Current player stats base address stored in `rcx`
    - Useful offsets from `[rcx]`:
        - `e0`: life
        - `f0`: gold (encrypted)
        - `f4`: mana
        - `100`: essence
        - `10c`: free pick element (use with mana)

## Tower Stats
- Possible injection point at `48 83 EC 28 48 8B 81 A0 00 00 00 48 85 C0 74 09` (`Tower.Game`)
    - Executes when placing tower
    - Tower base address stored in `rcx`
    - Useful offsets from `[rcx]`:
        - `c8`: damage (encrypted)
        - `cc`: speed (encrypted)
        - `d0`: range (encrypted)
        - `d4`: AOE (encrypted)

## Points (Upgrade or Shop)
- 4 bytes not encrypted
- High upgrade point value does not persist after restart

## Multiplayer
- Changing player stats appear to work
- Changing tower stats will only be reflected locally - other players will not see it and cause game to go out of sync
- [Ban system](https://store.steampowered.com/news/app/1018830/view/3037092063867692590) in place
