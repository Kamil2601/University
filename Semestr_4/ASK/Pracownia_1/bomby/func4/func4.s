    .globl func4

    .text

func4:
    push   %rbx             
    mov    %edx,%eax
    sub    %esi,%eax
    mov    %eax,%ebx
    shr    $0x1f,%ebx
    add    %eax,%ebx
    sar    %ebx
    add    %esi,%ebx
    cmp    %edi,%ebx
    jg     .L1
    cmp    %edi,%ebx
    jl     .L3
.L2:
    mov    %ebx,%eax        
    pop    %rbx
    retq
.L1:  
    lea    -0x1(%rbx),%edx   
    callq  func4
    add    %eax,%ebx
    jmp    .L2
.L3:
    lea    0x1(%rbx),%esi    
    callq  func4
    add    %eax,%ebx
    jmp    .L2
