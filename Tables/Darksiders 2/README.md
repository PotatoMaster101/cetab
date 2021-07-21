# Darksiders 2
| Information | Value                |
| :---------- | :------------------- |
| Edition     | Steam                |
| Version     | Deathinitive Edition |

## Player Stats
- Injection point at `F3 0F 11 40 08 48 8B 03`
    - Shared opcode, run every game tick
        - `[rax+330] == 0` is player
    - Useful offsets from `[rax]`:
        - `0`: HP
        - `4`: wraith
        - `8`: reaper form progress
        - `8C` and beyond: interesting player stats values in 4 bytes

## Enemy HP
- Injection point at `F3 41 0F 5C 46 28 F3 0F`
    - Damage dealt in `[r14+28]`
    - Current enemy HP in `xmm0`
