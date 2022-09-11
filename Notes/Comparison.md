# Comparison

- [Summary](#summary)
- [Is it Necessary](#is-it-necessary)
- [Save Flags](#save-flags)
- [Using Registers](#using-registers)
- [Using the Stack](#using-the-stack)
- [Using Structures](#using-structures)
- [Call Stack Backtracking](#call-stack-backtracking)
- [Range Filtering](#range-filtering)
- [Testing Comparisons](#testing-comparisons)

## Summary
Comparisons are used to distinguish and filter out undesired addresses used by shared opcodes. A typical example is a "god mode" cheat - the cheat should only make the player (maybe also allies) invulnerable, but not the enemy NPCs. In most games, the opcode for writing HP is shared between the player and other entities; without comparison(s), all entities in the game will also become invulnerable.

## Is it Necessary
Determine if a comparison is worth the effort; sometimes it won't matter if the opcode is shared. For example, infinite ammo might not need to be compared out, as the NPC AI will not take advantage of infinite ammo in most games.

## Save Flags
If there are any comparisons (such as `cmp` or `test`) before the injection point, use push flags (`pushf`) before performing any comparisons. For example:
```
cmp [rax+2C],0
mov [rbx+04],rcx        // <-- injection point
xor rcx,rcx
je Game.exe+4F53
```

In the AOB script, if there are comparisons (i.e., compare player and NPC), use `pushf` to "backup" the existing comparison flags first and `popf` at the end of script to restore the original flags:
```
newmem:
  pushf               // backup existing flags
  cmp [rdx+3F],0      // do comparison
  je infinite_hp
  popf                // restore original flags
  jmp code

infinite_hp:
  popf                // restore original flags
  mov [rbx+04],#100
  jmp return

code:
  mov [rbx+04],rcx
  jmp return
```

## Using Registers
Check if any registers are containing a distinct value that can uniquely identify the player. There might be cases where the distinct value is in a portion of a register. For example, `rax` contains `4D5874F3FFFFFFFF` where the lower 32 bit (`FFFFFFFF`) can be used to identify the player. In this case, "decay" `rax` to `eax` and compare with `FFFFFFFF`.

## Using the Stack
Check the stack values to see if there are any distinct values. The stack values can be referenced by `rsp` or `esp` in comparison scripts (depending on if the game is 64 bits).

## Using Structures
Compare the player structure with others and find any distinct value. This can be done on multiple registers; however, it is recommended to compare on the same register as the player structure, for example:
```
movss [rax+48],xmm0     // player structure is in rax
```

In this case, it is best to compare using only the `rax` register; other register values might be "unstable" and can lead to segfault. There might also be distinct values that can only be accessed by using multi-level pointers. It is best to avoid these as multi-level pointers can change after game restarts.

## Call Stack Backtracking
Sometimes the location to perform the comparison is too polluted (used by 100+ addresses). This is typically when the debugger landed in a standard C function such as `memcpy`. In this case, set a conditional breakpoint to break on the address to trace and backtrack one or more functions until a suitable injection point is found.

This technique can also be used when distinct values are hard to find. In some cases, the call stack between the player and others will differ, which can uniquely identify the player.

## Range Filtering
When distinct values are hard to find, the addresses can be filtered down using a range check. Typically a range check includes checking +2 and -2 on a value. For example, if player HP is 100, then the addresses can be filtered by `98 < HP < 102`. However, this method will not produce a unique comparison in most cases, only removing some of out of range values. Some other comparison methods need to be used after the filtering to get the unique address. An example of filtering:
```
// 98 < [rdx+3F] < 102
cmp [rdx+3F],0x62   // 98
jle out_of_range
cmp [rdx+3F],0x66   // 102
jge out_of_range

// perform other comparisons on [rdx+3F]
```

## Testing Comparisons
There are a few ways to test the compare:
- Progress further in the game, see if there are any events that can cause the compare to fail
- Restart the game, sometimes a "distinct" value used in comparison will change after a game restart
