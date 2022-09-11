# Registers

- [x64 Registers](#x64-registers)
- [SSE Registers](#sse-registers)
- [Example](#example)

## x64 Registers
| 64 Bits  | 32 Bits  | 16 Bits | 8 Bits (High) | 8 Bits (Low)    | Description                         |
| :------- | :------- | :------ | :------------ | :-------------- | :---------------------------------- |
| `rax`    | `eax`    | `ax`    | `ah`          | `al`            | General purpose                     |
| `rbx`    | `ebx`    | `bx`    | `bh`          | `bl`            | General purpose                     |
| `rcx`    | `ecx`    | `cx`    | `ch`          | `cl`            | General purpose                     |
| `rdx`    | `edx`    | `dx`    | `dh`          | `dl`            | General purpose                     |
| `rsi`    | `esi`    | `si`    | N/A           | `sil`           | General purpose (source index)      |
| `rdi`    | `edi`    | `di`    | N/A           | `dil`           | General purpose (destination index) |
| `rbp`    | `ebp`    | `bp`    | N/A           | `bpl`           | Base pointer                        |
| `rsp`    | `esp`    | `sp`    | N/A           | `spl`           | Stack pointer                       |
| `rip`    | `eip`    | N/A     | N/A           | N/A             | Instruction pointer                 |
| `rflags` | `eflags` | N/A     | N/A           | N/A             | Flag values                         |
| `r8`     | `r8d`    | `r8w`   | N/A           | `r8b` / `r8l`   | General purpose                     |
| `r9`     | `r9d`    | `r9w`   | N/A           | `r9b` / `r9l`   | General purpose                     |
| `r10`    | `r10d`   | `r10w`  | N/A           | `r10b` / `r10l` | General purpose                     |
| `r11`    | `r11d`   | `r11w`  | N/A           | `r11b` / `r11l` | General purpose                     |
| `r12`    | `r12d`   | `r12w`  | N/A           | `r12b` / `r12l` | General purpose                     |
| `r13`    | `r13d`   | `r13w`  | N/A           | `r13b` / `r13l` | General purpose                     |
| `r14`    | `r14d`   | `r14w`  | N/A           | `r14b` / `r14l` | General purpose                     |
| `r15`    | `r15d`   | `r15w`  | N/A           | `r15b` / `r15l` | General purpose                     |

## SSE Registers
| 255 Bits | 128 Bits | Description     |
| :------- | :------- | :-------------- |
| `ymm0`   | `xmm0`   | General purpose |
| `ymm1`   | `xmm1`   | General purpose |
| `ymm2`   | `xmm2`   | General purpose |
| `ymm3`   | `xmm3`   | General purpose |
| `ymm4`   | `xmm4`   | General purpose |
| `ymm5`   | `xmm5`   | General purpose |
| `ymm6`   | `xmm6`   | General purpose |
| `ymm7`   | `xmm7`   | General purpose |
| `ymm8`   | `xmm8`   | General purpose |
| `ymm9`   | `xmm9`   | General purpose |
| `ymm10`  | `xmm10`  | General purpose |
| `ymm11`  | `xmm11`  | General purpose |
| `ymm12`  | `xmm12`  | General purpose |
| `ymm13`  | `xmm13`  | General purpose |
| `ymm14`  | `xmm14`  | General purpose |
| `ymm15`  | `xmm15`  | General purpose |

## Example
Assume `rax` has the value `0x1122334455667788`:
| Register | Value              |
| :------- | :----------------- |
| `rax`    | `1122334455667788` |
| `eax`    | `55667788`         |
| `ax`     | `7788`             |
| `ah`     | `77`               |
| `al`     | `88`               |
