    .globl insert_sort

insert_sort:
    movq %rdi, %r8  # %r8 - i
    addq $8, %r8

.FOR_LOOP:
    cmp %rsi, %r8
    ja .END
    movq (%r8), %r10 # temp = *i %r10 - aktualnie zamieniany element
    movq %r8, %r9  # %r9 - j
    subq $8, %r9   # j = i-1

.WHILE_LOOP:
    cmp %rdi, %r9 # if j<first -> end while
    jb .END_WHILE

    cmp %r10, (%r9) # if *j >= temp -> end while
    jle .END_WHILE

    movq %r9, %r11 # j -> r11
    addq $8, %r11  # r11 = r11+1
    movq (%r9), %r12 # r12 = *j
    movq %r12, (%r11) # *(j+1) = r12 = *j

    subq $8, %r9 # j--
    jmp .WHILE_LOOP

.END_WHILE:
    addq $8, %r9
    movq %r10, (%r9) # *(j+1) = temp
    addq $8, %r8
    jmp .FOR_LOOP

.END:
    ret
