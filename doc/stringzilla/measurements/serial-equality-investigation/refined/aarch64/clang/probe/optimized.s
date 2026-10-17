	.file	"wrapper.c"
	.text
	.globl	probe_initialize                // -- Begin function probe_initialize
	.p2align	2
	.type	probe_initialize,@function
probe_initialize:                       // @probe_initialize
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end0:
	.size	probe_initialize, .Lfunc_end0-probe_initialize
	.cfi_endproc
                                        // -- End function
	.globl	probe_capabilities              // -- Begin function probe_capabilities
	.p2align	2
	.type	probe_capabilities,@function
probe_capabilities:                     // @probe_capabilities
	.cfi_startproc
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end1:
	.size	probe_capabilities, .Lfunc_end1-probe_capabilities
	.cfi_endproc
                                        // -- End function
	.globl	probe_register                  // -- Begin function probe_register
	.p2align	2
	.type	probe_register,@function
probe_register:                         // @probe_register
	.cfi_startproc
// %bb.0:
	ret
.Lfunc_end2:
	.size	probe_register, .Lfunc_end2-probe_register
	.cfi_endproc
                                        // -- End function
	.globl	probe_equal                     // -- Begin function probe_equal
	.p2align	2
	.type	probe_equal,@function
probe_equal:                            // @probe_equal
	.cfi_startproc
// %bb.0:
	cmp	w2, #16, lsl #12                // =65536
	b.ls	.LBB3_2
// %bb.1:
	mov	w0, #-2                         // =0xfffffffe
	ret
.LBB3_2:
	cbz	w2, .LBB3_10
// %bb.3:
	ldrb	w8, [x0]
	ldrb	w9, [x1]
	cmp	w8, w9
	b.ne	.LBB3_11
// %bb.4:
	cmp	w2, #24
	mov	w8, w2
	b.lo	.LBB3_8
.LBB3_5:                                // =>This Inner Loop Header: Depth=1
	ldr	x9, [x0], #8
	ldr	x10, [x1], #8
	cmp	x9, x10
	b.ne	.LBB3_11
// %bb.6:                               //   in Loop: Header=BB3_5 Depth=1
	sub	x8, x8, #8
	cmp	x8, #7
	b.hi	.LBB3_5
// %bb.7:
	cbz	x8, .LBB3_10
.LBB3_8:                                // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x0], #1
	ldrb	w10, [x1], #1
	cmp	w9, w10
	b.ne	.LBB3_11
// %bb.9:                               //   in Loop: Header=BB3_8 Depth=1
	subs	x8, x8, #1
	b.ne	.LBB3_8
.LBB3_10:
	mov	w0, #1                          // =0x1
	ret
.LBB3_11:
	mov	w0, wzr
	ret
.Lfunc_end3:
	.size	probe_equal, .Lfunc_end3-probe_equal
	.cfi_endproc
                                        // -- End function
	.ident	"Ubuntu clang version 21.1.8 (6ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
