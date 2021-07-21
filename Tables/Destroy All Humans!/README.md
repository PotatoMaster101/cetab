# Destroy All Humans!
| Information | Value |
| :---------- | :---- |
| Edition     | Steam |
| Version     | ???   |

## Player HP
- Stored as float, 1 dot = 1 hp
- Injection point at `F3 0F 11 83 98 00 00 00 0F 54 15`
    - Shared instruction, `rcx != 0` is player
    - Max HP stored in `[rbx+48]`
    - Current HP stored in `[rbx+98]`

## Zap Charge
- Stored as float
- Injection point at `F3 0F 11 91 3C 07 00 00 48`
    - Max charge in `[rcx+718]`
    - Current charge in `[rcx+73C]`

## Holobob
- Stored as float
- Injection point at `F3 0F 11 87 58 02 00 00 77`
    - Current holobob value stored in `[rdi+258]`
    - Max holobob value stored in `[rdi+210]`
