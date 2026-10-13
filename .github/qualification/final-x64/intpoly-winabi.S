.text
.globl assign_fixed
.type assign_fixed,@function
assign_fixed:
    negq %rcx
    testl %r9d,%r9d
    jle 2f
1:
    movq (%rdx),%r10
    xorq (%r8),%r10
    andq %rcx,%r10
    xorq %r10,(%rdx)
    subl $1,%r9d
    leaq 8(%rdx),%rdx
    leaq 8(%r8),%r8
    testl %r9d,%r9d
    jg 1b
2:
    ret
.globl assign_original
.type assign_original,@function
assign_original:
    negq %rcx
    testl %r9d,%r9d
    jle 4f
3:
    movq (%rdx),%r9
    xorq (%r8),%r9
    andq %rcx,%r9
    xorq %r9,(%rdx)
    subl $1,%r9d
    leaq 8(%rdx),%rdx
    leaq 8(%r8),%r8
    testl %r9d,%r9d
    jg 3b
4:
    ret
.section .note.GNU-stack,"",@progbits
