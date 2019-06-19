read = 0
write = 1
exit  = 60
bufor = 500


        .global _start
        .type _start, @function
        .section .text
str:
        .ascii "Hello, world!\12\0"

_start: 
        sub $bufor,%rsp
        mov %rsp, %r9
        mov $read,%rdi
        mov $read,%rax
        mov %rsp,%rsi
        mov $bufor,%rdx
        syscall
.LOOP2:
        add $1, %rsp
        cmp $0, (%rsp)
        jne .LOOP2
        sub $2, %rsp
.LOOP:
        mov $write, %rax
        mov $write, %rdi
        mov %rsp, %rsi
        mov $1, %rdx
        syscall
        sub $1, %rsp
        cmp %r9, %rsp
        jge .LOOP
        movq    $exit, %rax
        movq    $0, %rdi
        syscall
        .size   _start, . - _start
