	.file	"wrapper.c"
	.text
	.p2align 4
	.globl	patched_initialize
	.type	patched_initialize, @function
patched_initialize:
.LFB7479:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7479:
	.size	patched_initialize, .-patched_initialize
	.p2align 4
	.globl	patched_capabilities
	.type	patched_capabilities, @function
patched_capabilities:
.LFB7480:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7480:
	.size	patched_capabilities, .-patched_capabilities
	.p2align 4
	.globl	patched_register
	.type	patched_register, @function
patched_register:
.LFB7481:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE7481:
	.size	patched_register, .-patched_register
	.p2align 4
	.globl	patched_equal
	.type	patched_equal, @function
patched_equal:
.LFB7482:
	.cfi_startproc
	endbr64
	movl	%edx, %eax
	movl	$-2, %edx
	cmpl	$65536, %eax
	ja	.L5
	movl	%eax, %edx
	cmpl	$23, %eax
	ja	.L9
.L7:
	testq	%rdx, %rdx
	je	.L10
	xorl	%eax, %eax
	jmp	.L12
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rax
	cmpq	%rdx, %rax
	je	.L10
.L12:
	movzbl	(%rsi,%rax), %ecx
	cmpb	%cl, (%rdi,%rax)
	je	.L11
.L8:
	xorl	%edx, %edx
.L5:
	movl	%edx, %eax
	ret
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	jne	.L8
	subq	$8, %rdx
	addq	$8, %rdi
	addq	$8, %rsi
	cmpq	$7, %rdx
	ja	.L9
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L10:
	movl	$1, %edx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE7482:
	.size	patched_equal, .-patched_equal
	.ident	"GCC: (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
