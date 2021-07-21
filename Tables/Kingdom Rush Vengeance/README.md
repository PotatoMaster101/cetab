# Kingdom Rush Vengeance
| Information | Value    |
| :---------- | :------- |
| Edition     | Steam    |
| Version     | 1.9.9.20 |

## Game Stats
- Possible injection point at `89 91 40 08 00 00 C3`
    - Game base address in `rcx`
    - Useful offsets from `[rcx]`:
        - `840`: gold
        - `844`: health

## HP
- Possible injection point at `29 83 28 0C 00 00`
    - Shared opcode, `[rbx+598] != 0` is player/ally
    - Current HP in `[rbx+C28]`
    - Max HP in `[rbx+C24]`
