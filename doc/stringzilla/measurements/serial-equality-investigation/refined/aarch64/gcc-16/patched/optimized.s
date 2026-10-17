	.arch armv8-a
	.file	"wrapper.c"
	.text
	.align	2
	.p2align 5,,15
	.global	patched_initialize
	.type	patched_initialize, %function
patched_initialize:
.LFB4081:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4081:
	.size	patched_initialize, .-patched_initialize
	.align	2
	.p2align 5,,15
	.global	patched_capabilities
	.type	patched_capabilities, %function
patched_capabilities:
.LFB4082:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4082:
	.size	patched_capabilities, .-patched_capabilities
	.align	2
	.p2align 5,,15
	.global	patched_register
	.type	patched_register, %function
patched_register:
.LFB4083:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE4083:
	.size	patched_register, .-patched_register
	.align	2
	.p2align 5,,15
	.global	patched_equal
	.type	patched_equal, %function
patched_equal:
.LFB4084:
	.cfi_startproc
	cmp	w2, 65536
	bhi	.L24
	sxtw	x2, w2
	cmp	x2, 23
	bhi	.L9
	cbz	x2, .L11
	sub	x5, x2, #1
	cmp	x5, 13
	bls	.L23
	eor	x3, x1, x0
	tst	x3, 7
	bne	.L23
	neg	x4, x1
	and	x3, x4, 7
	add	x6, x3, 8
	cmp	x5, x6
	bcc	.L13
	cbz	x3, .L14
	ldrb	w6, [x0]
	ldrb	w5, [x1]
	cmp	w6, w5
	bne	.L8
	tst	x4, 6
	beq	.L25
	ldrb	w6, [x0, 1]
	ldrb	w5, [x1, 1]
	cmp	w6, w5
	bne	.L8
	cmp	x3, 2
	bls	.L26
	ldrb	w6, [x0, 2]
	ldrb	w5, [x1, 2]
	cmp	w6, w5
	bne	.L8
	tbz	x4, 2, .L27
	ldrb	w5, [x0, 3]
	ldrb	w4, [x1, 3]
	cmp	w5, w4
	bne	.L8
	cmp	x3, 4
	beq	.L14
	ldrb	w5, [x0, 4]
	ldrb	w4, [x1, 4]
	cmp	w5, w4
	bne	.L8
	cmp	x3, 5
	beq	.L14
	ldrb	w5, [x0, 5]
	ldrb	w4, [x1, 5]
	cmp	w5, w4
	bne	.L8
	cmp	x3, 7
	bne	.L28
	ldrb	w5, [x0, 6]
	ldrb	w4, [x1, 6]
	cmp	w5, w4
	bne	.L8
.L14:
	mov	x4, x3
.L15:
	ldr	d31, [x0, x3]
	add	x7, x0, x3
	ldr	d30, [x1, x3]
	add	x6, x1, x3
	cmeq	v31.8b, v31.8b, v30.8b
	not	v31.8b, v31.8b
	fmov	x5, d31
	cbnz	x5, .L29
	sub	x3, x2, x3
	lsr	x5, x3, 3
	cmp	x5, 2
	bne	.L17
	ldr	d30, [x6, 8]
	ldr	d31, [x7, 8]
	cmeq	v31.8b, v31.8b, v30.8b
	not	v31.8b, v31.8b
	fmov	x6, d31
	cbnz	x6, .L47
.L17:
	ubfiz	x5, x5, 3, 32
	add	x4, x4, x5
	cmp	x3, x5
	beq	.L11
.L18:
	ldrb	w5, [x0, x4]
	ldrb	w3, [x1, x4]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 1
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x1, x3]
	ldrb	w3, [x0, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 2
	cmp	x2, x3
	bls	.L11
.L21:
	ldrb	w5, [x1, x3]
	ldrb	w3, [x0, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 3
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 4
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 5
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 6
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 7
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 8
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 9
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 10
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 11
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 12
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 13
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x3, x4, 14
	cmp	x2, x3
	bls	.L11
	ldrb	w5, [x0, x3]
	ldrb	w3, [x1, x3]
	cmp	w5, w3
	bne	.L8
	add	x4, x4, 15
	cmp	x2, x4
	bls	.L11
	ldrb	w2, [x0, x4]
	ldrb	w0, [x1, x4]
	cmp	w2, w0
	cset	w0, eq
	ret
	.p2align 2,,3
.L9:
	ldr	x3, [x0]
	sub	x2, x2, #8
	ldr	x4, [x1]
	add	x0, x0, 8
	add	x1, x1, 8
	cmp	x4, x3
	bne	.L8
	cmp	x2, 7
	bhi	.L9
	cbnz	x2, .L23
.L11:
	mov	w0, 1
	ret
	.p2align 2,,3
.L23:
	mov	x3, 0
	b	.L20
	.p2align 2,,3
.L48:
	cmp	x2, x3
	beq	.L11
.L20:
	ldrb	w5, [x0, x3]
	ldrb	w4, [x1, x3]
	add	x3, x3, 1
	cmp	w5, w4
	beq	.L48
	.p2align 5,,15
.L8:
	mov	w0, 0
.L49:
	ret
	.p2align 2,,3
.L24:
	mov	w0, -2
	ret
.L13:
	ldrb	w4, [x1]
	ldrb	w3, [x0]
	cmp	w4, w3
	bne	.L8
	ldrb	w6, [x0, 1]
	mov	x3, 2
	ldrb	w5, [x1, 1]
	mov	x4, 0
	cmp	w6, w5
	beq	.L21
	mov	w0, 0
	b	.L49
	.p2align 2,,3
.L29:
	mov	x3, 0
	add	x4, x4, x3
	b	.L18
.L47:
	mov	x3, 8
	add	x4, x4, x3
	b	.L18
.L25:
	mov	x4, 1
	b	.L15
.L26:
	mov	x4, 2
	b	.L15
.L27:
	mov	x4, 3
	b	.L15
.L28:
	mov	x4, 6
	b	.L15
	.cfi_endproc
.LFE4084:
	.size	patched_equal, .-patched_equal
	.ident	"GCC: (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
