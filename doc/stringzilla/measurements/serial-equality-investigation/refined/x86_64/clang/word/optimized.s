	.file	"wrapper.c"
	.text
	.globl	word_initialize                 # -- Begin function word_initialize
	.p2align	4
	.type	word_initialize,@function
word_initialize:                        # @word_initialize
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	word_initialize, .Lfunc_end0-word_initialize
	.cfi_endproc
                                        # -- End function
	.globl	word_capabilities               # -- Begin function word_capabilities
	.p2align	4
	.type	word_capabilities,@function
word_capabilities:                      # @word_capabilities
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	word_capabilities, .Lfunc_end1-word_capabilities
	.cfi_endproc
                                        # -- End function
	.globl	word_register                   # -- Begin function word_register
	.p2align	4
	.type	word_register,@function
word_register:                          # @word_register
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end2:
	.size	word_register, .Lfunc_end2-word_register
	.cfi_endproc
                                        # -- End function
	.globl	word_equal                      # -- Begin function word_equal
	.p2align	4
	.type	word_equal,@function
word_equal:                             # @word_equal
	.cfi_startproc
# %bb.0:
	movl	$-2, %eax
	cmpl	$65536, %edx                    # imm = 0x10000
	ja	.LBB3_10
# %bb.1:
	movl	%edx, %eax
	cmpl	$24, %edx
	jb	.LBB3_2
# %bb.3:
	movq	%rax, %rdx
	movq	%rdi, %rcx
	.p2align	4
.LBB3_4:                                # =>This Inner Loop Header: Depth=1
	movq	(%rcx), %r8
	cmpq	(%rsi), %r8
	jne	.LBB3_9
# %bb.5:                                #   in Loop: Header=BB3_4 Depth=1
	addq	$8, %rcx
	addq	$8, %rsi
	addq	$-8, %rdx
	cmpq	$7, %rdx
	ja	.LBB3_4
	jmp	.LBB3_6
.LBB3_2:
	movq	%rdi, %rcx
.LBB3_6:
	addq	%rax, %rdi
	movl	$1, %eax
	cmpq	%rdi, %rcx
	je	.LBB3_10
	.p2align	4
.LBB3_8:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %edx
	cmpb	(%rsi), %dl
	jne	.LBB3_9
# %bb.11:                               #   in Loop: Header=BB3_8 Depth=1
	incq	%rcx
	incq	%rsi
	cmpq	%rdi, %rcx
	jne	.LBB3_8
.LBB3_10:
	retq
.LBB3_9:
	xorl	%eax, %eax
	retq
.Lfunc_end3:
	.size	word_equal, .Lfunc_end3-word_equal
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
