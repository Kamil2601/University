    .globl add_bignum

    .text

add_bignum:
    mov (%rdi), %r8d # a.n
    mov (%rsi), %r9d # b.n
    mov (%rdx), %r10d # r.n
    movq $0, %rcx

.LOOP_R:
    movb $0, 4(%rdx, %rcx, 1)
    inc %rcx
    cmp %rcx, %r8
    jg .LOOP_R

    movq $0, %rcx

.LOOP_A:    
    movb 4(%rdi, %rcx, 1), %al
    movb %al, 4(%rdx, %rcx, 1)
    inc %rcx
    cmp %rcx, %r8
    jg .LOOP_A

    movq $0, %rcx
    movq $0, %r15


.LOOP_B:
    movb 4(%rsi, %rcx, 1), %al
    adcb %al, 4(%rdx, %rcx, 1)
    adcb $0, 5(%rdx, %rcx, 1)
    incq %rcx
    cmp %rcx, %r9
    jg .LOOP_B
    

    ret
