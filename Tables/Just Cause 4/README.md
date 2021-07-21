# Just Cause 4
| Information | Value |
| :---------- | :---- |
| Edition     | Steam |
| Version     | ????  |

## Ammo
- 4 bytes not encrypted
- Possible injection point at `89 B4 B9 38 02 00 00`
    - Executes when reload
    - Current ammo stored in `esi`
    - Max ammo stored in `[rcx+rdi*4+2ec]`

## Clip Ammo
- 4 bytes not encrypted
- Possible injection point at `89 91 6C 05 00 00 C3`
    - Shared AOB with NPC
    - Executes when shoot/reload
    - Current clip ammo stored in `edx`
    - Useful offsets from `[rcx+558]`:
        - `70`: clip ammo cap
        - `88`: shooting speed
        - `dc`: damage
        - `16c`: bullet speed?

## Grapple Distance
- Float not encrypted, defaults to `80`
- Possible injection point at `8B 08 89 8B CC 03 00 00`
    - Executes every game tick
    - Current distance stored in `[rax]`
    - Useful offsets from `[rax]`:
        - `30`: grapple speed
- Notes:
    - Find flag (4 bytes with value `1` or `256`) that controls whether player can grapple
