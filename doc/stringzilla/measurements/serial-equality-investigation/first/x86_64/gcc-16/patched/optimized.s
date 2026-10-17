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
	movl	$-2, %ecx
	cmpl	$65536, %edx
	ja	.L31
	movl	%edx, %edx
	movq	%rsi, %rax
	leaq	(%rdi,%rdx), %r9
	cmpq	$23, %rdx
	ja	.L8
.L7:
	cmpq	%rdi, %r9
	je	.L23
	movq	%r9, %rsi
	subq	%rdi, %rsi
	leaq	-1(%rsi), %rcx
	cmpq	$61, %rcx
	jbe	.L15
	movq	%rax, %rdx
	xorq	%rdi, %rdx
	andl	$31, %edx
	jne	.L15
	movq	%rax, %rdx
	negq	%rdx
	andl	$31, %edx
	leaq	32(%rdx), %r8
	cmpq	%r8, %rcx
	jb	.L24
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rbx, -16(%rbp)
	testq	%rdx, %rdx
	.cfi_offset 3, -32
	je	.L25
	leaq	(%rax,%rdx), %r10
	movq	%rdi, %rcx
	movq	%r10, %rbx
	jmp	.L18
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L40:
	addq	$1, %rax
	addq	$1, %rcx
	cmpq	%rax, %r10
	je	.L39
.L18:
	movzbl	(%rcx), %r11d
	cmpb	%r11b, (%rax)
	je	.L40
.L11:
	cmpq	%rcx, %r9
	movq	-16(%rbp), %rbx
	leave
	.cfi_restore 6
	.cfi_restore 3
	.cfi_def_cfa 7, 8
	sete	%cl
	movzbl	%cl, %ecx
	movl	%ecx, %eax
	ret
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L41:
	addq	$8, %rdi
	movq	%r9, %rdx
	addq	$8, %rax
	subq	%rdi, %rdx
	cmpq	$7, %rdx
	jbe	.L7
.L8:
	movq	(%rax), %rsi
	cmpq	%rsi, (%rdi)
	je	.L41
	xorl	%ecx, %ecx
.L31:
	movl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	movq	%r14, -8(%rbp)
	.cfi_offset 14, -24
.L17:
	subq	%rdx, %rsi
	vmovq	%rcx, %xmm4
	addq	%rdi, %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %r11
	movq	%rsi, %r14
	vpbroadcastq	%xmm4, %ymm1
	xorl	%esi, %esi
	vpaddq	.LC1(%rip), %ymm1, %ymm1
	shrq	$5, %r11
	vpxor	%xmm3, %xmm3, %xmm3
	xorl	%edi, %edi
	vpbroadcastq	.LC3(%rip), %ymm2
	jmp	.L9
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$1, %r8
	addq	$32, %rsi
	adcq	$0, %rdi
	cmpq	%r11, %r8
	jnb	.L42
	vpaddq	%ymm2, %ymm1, %ymm1
.L9:
	vmovdqa	(%rdx,%rsi), %ymm0
	vpcmpeqb	(%r10,%rsi), %ymm0, %ymm0
	vpcmpeqb	%ymm3, %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	je	.L19
	addq	%rsi, %rcx
	leaq	(%rbx,%rsi), %rax
	vzeroupper
	jmp	.L12
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L43:
	addq	$1, %rcx
	addq	$1, %rax
	cmpq	%rcx, %r9
	je	.L38
.L12:
	movzbl	(%rcx), %esi
	cmpb	%sil, (%rax)
	je	.L43
.L38:
	movq	-8(%rbp), %r14
	.cfi_remember_state
	.cfi_restore 14
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_restore_state
	salq	$5, %r11
	cmpq	%r11, %r14
	je	.L10
	addq	%r11, %rcx
	leaq	(%rbx,%r11), %rax
	vzeroupper
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 14
	movq	%rdi, %rcx
	jmp	.L13
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L44:
	addq	$1, %rcx
	addq	$1, %rax
	cmpq	%rcx, %r9
	je	.L34
.L13:
	movzbl	(%rcx), %edi
	cmpb	%dil, (%rax)
	je	.L44
.L34:
	cmpq	%rcx, %r9
	sete	%cl
	movzbl	%cl, %ecx
	jmp	.L31
.L24:
	movq	%rdi, %rcx
	jmp	.L32
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L45:
	addq	$1, %rcx
	addq	$1, %rax
	cmpq	%rcx, %r9
	je	.L34
.L32:
	movzbl	(%rcx), %esi
	cmpb	%sil, (%rax)
	je	.L45
	jmp	.L34
.L23:
	movq	%r9, %rcx
	jmp	.L34
.L25:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	movq	%r14, -8(%rbp)
	.cfi_offset 14, -24
	movq	%rax, %rbx
	movq	%rdi, %rcx
	movq	%rax, %r10
	jmp	.L17
.L10:
	vpbroadcastq	.LC4(%rip), %ymm0
	vpaddq	%ymm0, %ymm1, %ymm1
	vextracti128	$0x1, %ymm1, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vzeroupper
	movq	-8(%rbp), %r14
	.cfi_restore 14
	jmp	.L11
	.cfi_endproc
.LFE7482:
	.size	patched_equal, .-patched_equal
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.quad	32
	.align 8
.LC4:
	.quad	29
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
