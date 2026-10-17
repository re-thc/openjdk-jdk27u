	.file	"wrapper.c"
	.text
	.globl	current_initialize              // -- Begin function current_initialize
	.p2align	2
	.type	current_initialize,@function
current_initialize:                     // @current_initialize
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end0:
	.size	current_initialize, .Lfunc_end0-current_initialize
	.cfi_endproc
                                        // -- End function
	.globl	current_capabilities            // -- Begin function current_capabilities
	.p2align	2
	.type	current_capabilities,@function
current_capabilities:                   // @current_capabilities
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end1:
	.size	current_capabilities, .Lfunc_end1-current_capabilities
	.cfi_endproc
                                        // -- End function
	.globl	current_register                // -- Begin function current_register
	.p2align	2
	.type	current_register,@function
current_register:                       // @current_register
	.cfi_startproc
// %bb.0:
	ret
.Lfunc_end2:
	.size	current_register, .Lfunc_end2-current_register
	.cfi_endproc
                                        // -- End function
	.globl	current_equal                   // -- Begin function current_equal
	.p2align	2
	.type	current_equal,@function
current_equal:                          // @current_equal
	.cfi_startproc
// %bb.0:
	cmp	w2, #16, lsl #12                // =65536
	b.ls	.LBB3_2
// %bb.1:
	mov	w0, #-2                         // =0xfffffffe
	ret
.LBB3_2:
	cbz	w2, .LBB3_6
// %bb.3:
	mov	w8, w2
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x0], #1
	ldrb	w10, [x1], #1
	cmp	w9, w10
	b.ne	.LBB3_7
// %bb.5:                               //   in Loop: Header=BB3_4 Depth=1
	subs	x8, x8, #1
	b.ne	.LBB3_4
.LBB3_6:
	mov	w0, #1                          // =0x1
	ret
.LBB3_7:
	mov	w0, wzr
	ret
.Lfunc_end3:
	.size	current_equal, .Lfunc_end3-current_equal
	.cfi_endproc
                                        // -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
