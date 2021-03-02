    .globl  clz
        
    .text
clz:
    movq $32, %rax # wynik w %rax
    movq $0x80000000, %rbx # maska w %rbx
    mov $16, %rcx # długość skoku w #rcx
    

.LOOP:
    cmp %rdi, %rbx
    ja .IF

.ELSE:
    shlq %cl, %rbx
    subq %rcx, %rax
    jmp .AFTER_IF

.IF:
    shrq %cl, %rbx
    addq %rcx, %rax

.AFTER_IF:
    shrq $1, %rcx
    jne .LOOP

    movq %rbx, %r8
    shlq $1, %rbx
    cmp %rdi, %rbx
    jbe .DEC
    shrq $1, %r8
    cmp %rdi, %r8
    jae .INC
    ret
.DEC:
    decq %rax
    ret
.INC:
    incq %rax
    ret
.RET_64:
    movq $64, %rax
    ret
