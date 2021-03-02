puzzle4:
    movq %rcx, %rax
    subq %rdx, %rax
    shrq %rax
    addq %rdx, %rax
    cmpq %rdx, %rcx
    jb .L5
    movq (%rdi,%rax,8), %r8
    cmpq %rsi, %r8
    je .L10
    cmpq %rsi, %r8
    jg .L11
    leaq 1(%rax), %rdx
    call puzzle4
.L10:
    ret
.L11:
    leaq -1(%rax), %rcx
    call puzzle4
    ret
.L5:
    movl $-1, %eax
    ret