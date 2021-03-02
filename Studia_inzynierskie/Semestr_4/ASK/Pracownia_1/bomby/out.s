Dump of assembler code for function phase_defused:
=> 0x0000555555555874 <+0>:     cmpl   $0x6,0x202ef1(%rip)        # 0x55555575876c <num_input_strings>
   0x000055555555587b <+7>:     je     0x55555555587f <phase_defused+11>
   0x000055555555587d <+9>:     repz retq
   0x000055555555587f <+11>:    sub    $0x68,%rsp
   0x0000555555555883 <+15>:    lea    0x8(%rsp),%rcx
   0x0000555555555888 <+20>:    lea    0xc(%rsp),%rdx
   0x000055555555588d <+25>:    lea    0x10(%rsp),%r8
   0x0000555555555892 <+30>:    lea    0xf80(%rip),%rsi        # 0x555555556819
   0x0000555555555899 <+37>:    lea    0x202fd0(%rip),%rdi        # 0x555555758870 <input_strings+240>
   0x00005555555558a0 <+44>:    mov    $0x0,%eax
   0x00005555555558a5 <+49>:    callq  0x555555554e90 <__isoc99_sscanf@plt>
   0x00005555555558aa <+54>:    cmp    $0x3,%eax
   0x00005555555558ad <+57>:    je     0x5555555558c1 <phase_defused+77>
   0x00005555555558af <+59>:    lea    0xea2(%rip),%rdi        # 0x555555556758
   0x00005555555558b6 <+66>:    callq  0x555555554dd0 <puts@plt>
   0x00005555555558bb <+71>:    add    $0x68,%rsp
   0x00005555555558bf <+75>:    jmp    0x55555555587d <phase_defused+9>
   0x00005555555558c1 <+77>:    lea    0x10(%rsp),%rdi
---Type <return> to continue, or q <return> to quit---
   0x00005555555558c6 <+82>:    lea    0xf55(%rip),%rsi        # 0x555555556822
   0x00005555555558cd <+89>:    callq  0x5555555555bc <strings_not_equal>
   0x00005555555558d2 <+94>:    test   %eax,%eax
   0x00005555555558d4 <+96>:    jne    0x5555555558af <phase_defused+59>
   0x00005555555558d6 <+98>:    lea    0xe1b(%rip),%rdi        # 0x5555555566f8
   0x00005555555558dd <+105>:   callq  0x555555554dd0 <puts@plt>
   0x00005555555558e2 <+110>:   lea    0xe37(%rip),%rdi        # 0x555555556720
   0x00005555555558e9 <+117>:   callq  0x555555554dd0 <puts@plt>
   0x00005555555558ee <+122>:   mov    $0x0,%eax
   0x00005555555558f3 <+127>:   callq  0x5555555554cd <secret_phase>
   0x00005555555558f8 <+132>:   jmp    0x5555555558af <phase_defused+59>
End of assembler dump.