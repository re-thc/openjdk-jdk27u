	.file	"wrapper.c"
	.text
	.globl	probe_initialize                # -- Begin function probe_initialize
	.p2align	4
	.type	probe_initialize,@function
probe_initialize:                       # @probe_initialize
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	probe_initialize, .Lfunc_end0-probe_initialize
	.cfi_endproc
                                        # -- End function
	.globl	probe_capabilities              # -- Begin function probe_capabilities
	.p2align	4
	.type	probe_capabilities,@function
probe_capabilities:                     # @probe_capabilities
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	probe_capabilities, .Lfunc_end1-probe_capabilities
	.cfi_endproc
                                        # -- End function
	.globl	probe_register                  # -- Begin function probe_register
	.p2align	4
	.type	probe_register,@function
probe_register:                         # @probe_register
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end2:
	.size	probe_register, .Lfunc_end2-probe_register
	.cfi_endproc
                                        # -- End function
	.globl	probe_equal                     # -- Begin function probe_equal
	.p2align	4
	.type	probe_equal,@function
probe_equal:                            # @probe_equal
	.cfi_startproc
# %bb.0:
	movl	$-2, %eax
	cmpl	$65536, %edx                    # imm = 0x10000
	ja	.LBB3_4
# %bb.1:
	movl	$1, %eax
	testl	%edx, %edx
	je	.LBB3_4
# %bb.2:
	movzbl	(%rdi), %ecx
	cmpb	(%rsi), %cl
	jne	.LBB3_3
# %bb.5:
	movl	%edx, %ecx
	cmpl	$24, %edx
	jb	.LBB3_9
	.p2align	4
.LBB3_6:                                # =>This Inner Loop Header: Depth=1
	movq	(%rdi), %rdx
	cmpq	(%rsi), %rdx
	jne	.LBB3_3
# %bb.7:                                #   in Loop: Header=BB3_6 Depth=1
	addq	$8, %rdi
	addq	$8, %rsi
	addq	$-8, %rcx
	cmpq	$7, %rcx
	ja	.LBB3_6
# %bb.8:
	testq	%rcx, %rcx
	je	.LBB3_4
.LBB3_9:
	xorl	%edx, %edx
	.p2align	4
.LBB3_11:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rdx), %r8d
	cmpb	(%rsi,%rdx), %r8b
	jne	.LBB3_3
# %bb.10:                               #   in Loop: Header=BB3_11 Depth=1
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB3_11
.LBB3_4:
	retq
.LBB3_3:
	xorl	%eax, %eax
	retq
.Lfunc_end3:
	.size	probe_equal, .Lfunc_end3-probe_equal
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
