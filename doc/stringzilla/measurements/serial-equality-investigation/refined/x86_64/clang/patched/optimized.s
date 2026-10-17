	.file	"wrapper.c"
	.text
	.globl	patched_initialize              # -- Begin function patched_initialize
	.p2align	4
	.type	patched_initialize,@function
patched_initialize:                     # @patched_initialize
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	patched_initialize, .Lfunc_end0-patched_initialize
	.cfi_endproc
                                        # -- End function
	.globl	patched_capabilities            # -- Begin function patched_capabilities
	.p2align	4
	.type	patched_capabilities,@function
patched_capabilities:                   # @patched_capabilities
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	patched_capabilities, .Lfunc_end1-patched_capabilities
	.cfi_endproc
                                        # -- End function
	.globl	patched_register                # -- Begin function patched_register
	.p2align	4
	.type	patched_register,@function
patched_register:                       # @patched_register
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end2:
	.size	patched_register, .Lfunc_end2-patched_register
	.cfi_endproc
                                        # -- End function
	.globl	patched_equal                   # -- Begin function patched_equal
	.p2align	4
	.type	patched_equal,@function
patched_equal:                          # @patched_equal
	.cfi_startproc
# %bb.0:
	movl	$-2, %eax
	cmpl	$65536, %edx                    # imm = 0x10000
	ja	.LBB3_9
# %bb.1:
	movl	%edx, %ecx
	cmpl	$24, %edx
	jb	.LBB3_4
	.p2align	4
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movq	(%rdi), %rax
	cmpq	(%rsi), %rax
	jne	.LBB3_8
# %bb.3:                                #   in Loop: Header=BB3_2 Depth=1
	addq	$8, %rdi
	addq	$8, %rsi
	addq	$-8, %rcx
	cmpq	$7, %rcx
	ja	.LBB3_2
.LBB3_4:
	movl	$1, %eax
	testq	%rcx, %rcx
	je	.LBB3_9
# %bb.5:
	xorl	%edx, %edx
	.p2align	4
.LBB3_7:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rdx), %r8d
	cmpb	(%rsi,%rdx), %r8b
	jne	.LBB3_8
# %bb.6:                                #   in Loop: Header=BB3_7 Depth=1
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB3_7
.LBB3_9:
	retq
.LBB3_8:
	xorl	%eax, %eax
	retq
.Lfunc_end3:
	.size	patched_equal, .Lfunc_end3-patched_equal
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
