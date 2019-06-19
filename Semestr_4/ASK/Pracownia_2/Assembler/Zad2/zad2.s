    .globl sqrf

.sqrf:
    mov $0x7F800000, %eax
    and %edi, %eax
    shr $23, %eax
    sub $127, %eax
    imul $2, %eax
    mov $0x007FFFFF, %r11d 
    and %edi, %r11d
    or $0x00800000, %r11d
    imul %r11, %r11
    shrq $23, %r11

    cmp $0x1000000, %r11d
    jb .SKIP_IF

    add $1, %eax
    shr $1, %r11d
    
.SKIP_IF:
    cmp $-126, %eax
    jl .ZERO

    add $127, %eax

    xor $0x00800000, %r11d

    shl $23, %eax
    
    or %r11d, %eax
    ret

.ZERO:
    mov $0, %eax
    ret
