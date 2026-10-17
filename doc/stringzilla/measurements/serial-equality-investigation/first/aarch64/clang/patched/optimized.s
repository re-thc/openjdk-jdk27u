	.file	"wrapper.c"
	.text
	.globl	patched_initialize              // -- Begin function patched_initialize
	.p2align	2
	.type	patched_initialize,@function
patched_initialize:                     // @patched_initialize
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end0:
	.size	patched_initialize, .Lfunc_end0-patched_initialize
	.cfi_endproc
                                        // -- End function
	.globl	patched_capabilities            // -- Begin function patched_capabilities
	.p2align	2
	.type	patched_capabilities,@function
patched_capabilities:                   // @patched_capabilities
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end1:
	.size	patched_capabilities, .Lfunc_end1-patched_capabilities
	.cfi_endproc
                                        // -- End function
	.globl	patched_register                // -- Begin function patched_register
	.p2align	2
	.type	patched_register,@function
patched_register:                       // @patched_register
	.cfi_startproc
// %bb.0:
	ret
.Lfunc_end2:
	.size	patched_register, .Lfunc_end2-patched_register
	.cfi_endproc
                                        // -- End function
	.globl	patched_equal                   // -- Begin function patched_equal
	.p2align	2
	.type	patched_equal,@function
patched_equal:                          // @patched_equal
	.cfi_startproc
// %bb.0:
	cmp	w2, #16, lsl #12                // =65536
	b.ls	.LBB3_2
// %bb.1:
	mov	w0, #-2                         // =0xfffffffe
	ret
.LBB3_2:
	cmp	w2, #24
	mov	w9, w2
	b.lo	.LBB3_10
// %bb.3:
	mov	x10, x9
	mov	x8, x0
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	ldr	x11, [x8], #8
	ldr	x12, [x1], #8
	cmp	x11, x12
	b.ne	.LBB3_12
// %bb.5:                               //   in Loop: Header=BB3_4 Depth=1
	sub	x10, x10, #8
	cmp	x10, #7
	b.hi	.LBB3_4
// %bb.6:
	add	x9, x0, x9
	cmp	x8, x9
	b.eq	.LBB3_11
.LBB3_7:                                // =>This Inner Loop Header: Depth=1
	ldrb	w10, [x8], #1
	ldrb	w11, [x1], #1
	cmp	w10, w11
	b.ne	.LBB3_12
// %bb.8:                               //   in Loop: Header=BB3_7 Depth=1
	cmp	x8, x9
	b.ne	.LBB3_7
// %bb.9:
	mov	w0, #1                          // =0x1
	ret
.LBB3_10:
	mov	x8, x0
	add	x9, x0, x9
	cmp	x0, x9
	b.ne	.LBB3_7
.LBB3_11:
	mov	w0, #1                          // =0x1
	ret
.LBB3_12:
	mov	w0, wzr
	ret
.Lfunc_end3:
	.size	patched_equal, .Lfunc_end3-patched_equal
	.cfi_endproc
                                        // -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
