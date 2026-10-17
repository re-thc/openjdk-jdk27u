	.file	"wrapper.c"
	.text
	.globl	current_initialize              # -- Begin function current_initialize
	.p2align	4
	.type	current_initialize,@function
current_initialize:                     # @current_initialize
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	current_initialize, .Lfunc_end0-current_initialize
	.cfi_endproc
                                        # -- End function
	.globl	current_capabilities            # -- Begin function current_capabilities
	.p2align	4
	.type	current_capabilities,@function
current_capabilities:                   # @current_capabilities
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	current_capabilities, .Lfunc_end1-current_capabilities
	.cfi_endproc
                                        # -- End function
	.globl	current_register                # -- Begin function current_register
	.p2align	4
	.type	current_register,@function
current_register:                       # @current_register
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end2:
	.size	current_register, .Lfunc_end2-current_register
	.cfi_endproc
                                        # -- End function
	.globl	current_equal                   # -- Begin function current_equal
	.p2align	4
	.type	current_equal,@function
current_equal:                          # @current_equal
	.cfi_startproc
# %bb.0:
	movl	$-2, %eax
	cmpl	$65536, %edx                    # imm = 0x10000
	ja	.LBB3_6
# %bb.1:
	movl	$1, %eax
	testl	%edx, %edx
	je	.LBB3_6
# %bb.2:
	movl	%edx, %ecx
	xorl	%edx, %edx
	.p2align	4
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rdx), %r8d
	cmpb	(%rsi,%rdx), %r8b
	jne	.LBB3_4
# %bb.5:                                #   in Loop: Header=BB3_3 Depth=1
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB3_3
.LBB3_6:
	retq
.LBB3_4:
	xorl	%eax, %eax
	retq
.Lfunc_end3:
	.size	current_equal, .Lfunc_end3-current_equal
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
