# Mr. Prepper
| Information | Value |
| :---------- | :---- |
| Edition     | Steam |
| Version     | 1.17  |

## Player
- Possible injection point at `55 48 8B EC 48 83 EC 30 48 89 75 F0 48 89 7D F8 48 8B F1 48 8B 86 B8` (`GetWalkingSurfaceType`)
    - Player base address in `rax`
    - Useful offsets from `[rax]`:
        - `12c`: walking speed (if set too high player will disappear after changing zone)
        - `130`: running speed (if set too high player will disappear after changing zone)
