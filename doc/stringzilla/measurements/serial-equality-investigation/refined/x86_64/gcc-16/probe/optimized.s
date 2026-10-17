	.file	"wrapper.c"
	.text
	.p2align 4
	.globl	probe_initialize
	.type	probe_initialize, @function
probe_initialize:
.LFB7479:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7479:
	.size	probe_initialize, .-probe_initialize
	.p2align 4
	.globl	probe_capabilities
	.type	probe_capabilities, @function
probe_capabilities:
.LFB7480:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7480:
	.size	probe_capabilities, .-probe_capabilities
	.p2align 4
	.globl	probe_register
	.type	probe_register, @function
probe_register:
.LFB7481:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE7481:
	.size	probe_register, .-probe_register
	.p2align 4
	.globl	probe_equal
	.type	probe_equal, @function
probe_equal:
.LFB7482:
	.cfi_startproc
	endbr64
	cmpl	$65536, %edx
	ja	.L13
	movl	%edx, %edx
	testq	%rdx, %rdx
	je	.L7
	movzbl	(%rsi), %eax
	cmpb	%al, (%rdi)
	je	.L19
.L8:
	xorl	%eax, %eax
	ret
.L13:
	movl	$-2, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	cmpq	$23, %rdx
	ja	.L11
.L9:
	xorl	%eax, %eax
	jmp	.L12
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L20:
	addq	$1, %rax
	cmpq	%rdx, %rax
	jnb	.L7
.L12:
	movzbl	(%rsi,%rax), %ecx
	cmpb	%cl, (%rdi,%rax)
	je	.L20
	jmp	.L8
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L11:
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	jne	.L8
	subq	$8, %rdx
	addq	$8, %rdi
	addq	$8, %rsi
	cmpq	$7, %rdx
	ja	.L11
	testq	%rdx, %rdx
	jne	.L9
.L7:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE7482:
	.size	probe_equal, .-probe_equal
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
