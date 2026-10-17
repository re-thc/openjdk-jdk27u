	.file	"wrapper.c"
	.text
	.p2align 4
	.globl	current_initialize
	.type	current_initialize, @function
current_initialize:
.LFB7479:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7479:
	.size	current_initialize, .-current_initialize
	.p2align 4
	.globl	current_capabilities
	.type	current_capabilities, @function
current_capabilities:
.LFB7480:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE7480:
	.size	current_capabilities, .-current_capabilities
	.p2align 4
	.globl	current_register
	.type	current_register, @function
current_register:
.LFB7481:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE7481:
	.size	current_register, .-current_register
	.p2align 4
	.globl	current_equal
	.type	current_equal, @function
current_equal:
.LFB7482:
	.cfi_startproc
	endbr64
	cmpl	$65536, %edx
	ja	.L20
	movl	%edx, %edx
	leaq	(%rdi,%rdx), %r10
	cmpq	%r10, %rdi
	je	.L34
	leaq	-1(%rdx), %rax
	movq	%rsi, %rcx
	cmpq	$61, %rax
	jbe	.L15
	movq	%rdi, %rsi
	xorq	%rcx, %rsi
	andl	$31, %esi
	jne	.L15
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rcx, %r9
	negq	%r9
	andl	$31, %r9d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	32(%r9), %rsi
	subq	$16, %rsp
	movq	%rbx, -16(%rbp)
	cmpq	%rsi, %rax
	.cfi_offset 3, -32
	jb	.L22
	testq	%r9, %r9
	je	.L23
	leaq	(%rdi,%r9), %r8
	movq	%rcx, %rsi
	movq	%rdi, %rax
	movq	%r8, %r11
	jmp	.L18
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$1, %rax
	addq	$1, %rsi
	cmpq	%rax, %r8
	je	.L35
.L18:
	movzbl	(%rsi), %ebx
	cmpb	%bl, (%rax)
	je	.L36
.L10:
	cmpq	%rax, %r10
	movq	-16(%rbp), %rbx
	leave
	.cfi_remember_state
	.cfi_restore 6
	.cfi_restore 3
	.cfi_def_cfa 7, 8
	sete	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movq	%r12, -8(%rbp)
	.cfi_offset 12, -24
.L17:
	subq	%r9, %rdx
	vmovq	%r11, %xmm4
	addq	%rcx, %r9
	xorl	%eax, %eax
	movq	%rdx, %r12
	movq	%rdx, %rbx
	vpbroadcastq	%xmm4, %ymm0
	xorl	%edx, %edx
	vpaddq	.LC2(%rip), %ymm0, %ymm0
	shrq	$5, %r12
	vpxor	%xmm3, %xmm3, %xmm3
	xorl	%edi, %edi
	vpbroadcastq	.LC4(%rip), %ymm2
	jmp	.L8
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$1, %rdi
	addq	$32, %rax
	adcq	$0, %rdx
	cmpq	%r12, %rdi
	jnb	.L37
	vpaddq	%ymm2, %ymm0, %ymm0
.L8:
	vmovdqa	(%r8,%rax), %ymm1
	movq	%rax, %rcx
	vpcmpeqb	(%r9,%rax), %ymm1, %ymm1
	vpcmpeqb	%ymm3, %ymm1, %ymm1
	vptest	%ymm1, %ymm1
	je	.L19
	addq	%rsi, %rcx
	leaq	(%r11,%rax), %rax
	vzeroupper
	movq	-8(%rbp), %r12
	.cfi_restore 12
	jmp	.L11
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L38:
	addq	$1, %rax
	addq	$1, %rcx
	cmpq	%rax, %r10
	je	.L10
.L11:
	movzbl	(%rcx), %ebx
	cmpb	%bl, (%rax)
	je	.L38
	cmpq	%rax, %r10
	movq	-16(%rbp), %rbx
	leave
	.cfi_restore 6
	.cfi_restore 3
	.cfi_def_cfa 7, 8
	sete	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	.cfi_offset 12, -24
	salq	$5, %r12
	cmpq	%r12, %rbx
	je	.L9
	leaq	(%r11,%r12), %rax
	leaq	(%rsi,%r12), %rcx
	vzeroupper
	movq	-8(%rbp), %r12
	.cfi_restore 12
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	movq	%rdi, %rax
	jmp	.L13
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L39:
	addq	$1, %rax
	addq	$1, %rcx
	cmpq	%rax, %r10
	je	.L29
.L13:
	movzbl	(%rcx), %edx
	cmpb	%dl, (%rax)
	je	.L39
.L29:
	cmpq	%rax, %r10
	sete	%al
	movzbl	%al, %eax
	ret
.L22:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	movq	%rdi, %rax
	jmp	.L11
.L34:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$1, %eax
	ret
.L9:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	.cfi_offset 12, -24
	vpbroadcastq	.LC3(%rip), %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vzeroupper
	movq	-8(%rbp), %r12
	.cfi_restore 12
	jmp	.L10
.L23:
	movq	%r12, -8(%rbp)
	.cfi_offset 12, -24
	movq	%rcx, %rsi
	movq	%rdi, %r11
	movq	%rdi, %r8
	jmp	.L17
.L20:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movl	$-2, %eax
	ret
	.cfi_endproc
.LFE7482:
	.size	current_equal, .-current_equal
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.quad	29
	.align 8
.LC4:
	.quad	32
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
