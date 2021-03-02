   .globl  revbit

    .text
revbit:
    movq %rdi, %rax

    movq $0xFFFFFFFF00000000, %rcx
    and %rax, %rcx
    shrq $32, %rcx
    movq $0xFFFFFFFF, %r8
    andq %r8, %rax
    shlq $32, %rax
    orq %rcx, %rax

    movq $0xFFFF0000FFFF0000, %rcx
    andq %rax, %rcx
    shrq $16, %rcx
    movq $0xFFFF0000FFFF, %r8
    andq %r8, %rax
    shlq $16, %rax
    orq %rcx, %rax

    movq $0xFF00FF00FF00FF00, %rcx
    andq %rax, %rcx
    shrq $8, %rcx
    movq $0xFF00FF00FF00FF, %r8
    andq %r8, %rax
    shlq $8, %rax
    orq %rcx, %rax

    movq $0xF0F0F0F0F0F0F0F0, %rcx
    andq %rax, %rcx
    shrq $4, %rcx
    movq $0xF0F0F0F0F0F0F0F, %r8
    andq %r8, %rax
    shlq $4, %rax
    orq %rcx, %rax


    movq $0xCCCCCCCCCCCCCCCC, %rcx
    andq %rax, %rcx
    shrq $2, %rcx
    movq $0x3333333333333333, %r8
    andq %r8, %rax
    shlq $2, %rax
    orq %rcx, %rax

    movq $0xAAAAAAAAAAAAAAAA, %rcx
    andq %rax, %rcx
    shrq $1, %rcx
    movq $0x5555555555555555, %r8
    andq %r8, %rax
    shlq $1, %rax
    orq %rcx, %rax
    ret
