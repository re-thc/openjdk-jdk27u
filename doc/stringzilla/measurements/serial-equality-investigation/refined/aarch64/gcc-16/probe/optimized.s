	.arch armv8-a
	.file	"wrapper.c"
	.text
	.align	2
	.p2align 5,,15
	.global	probe_initialize
	.type	probe_initialize, %function
probe_initialize:
.LFB4081:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4081:
	.size	probe_initialize, .-probe_initialize
	.align	2
	.p2align 5,,15
	.global	probe_capabilities
	.type	probe_capabilities, %function
probe_capabilities:
.LFB4082:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4082:
	.size	probe_capabilities, .-probe_capabilities
	.align	2
	.p2align 5,,15
	.global	probe_register
	.type	probe_register, %function
probe_register:
.LFB4083:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE4083:
	.size	probe_register, .-probe_register
	.align	2
	.p2align 5,,15
	.global	probe_equal
	.type	probe_equal, %function
probe_equal:
.LFB4084:
	.cfi_startproc
	cmp	w2, 65536
	bhi	.L21
	sxtw	x3, w2
	cbz	w2, .L7
	ldrb	w4, [x0]
	ldrb	w2, [x1]
	cmp	w4, w2
	beq	.L43
.L8:
	mov	w0, 0
.L5:
	ret
	.p2align 2,,3
.L43:
	cmp	x3, 23
	bhi	.L11
	sub	x5, x3, #1
	cmp	x5, 13
	bls	.L12
	eor	x2, x1, x0
	tst	x2, 7
	bne	.L12
	neg	x4, x1
	and	x2, x4, 7
	add	x6, x2, 8
	cmp	x5, x6
	bcc	.L22
	cbz	x2, .L15
	tst	x4, 6
	beq	.L23
	ldrb	w6, [x0, 1]
	ldrb	w5, [x1, 1]
	cmp	w6, w5
	bne	.L8
	cmp	x2, 2
	bls	.L24
	ldrb	w6, [x0, 2]
	ldrb	w5, [x1, 2]
	cmp	w6, w5
	bne	.L8
	tbz	x4, 2, .L25
	ldrb	w5, [x0, 3]
	ldrb	w4, [x1, 3]
	cmp	w5, w4
	bne	.L8
	cmp	x2, 4
	beq	.L15
	ldrb	w5, [x0, 4]
	ldrb	w4, [x1, 4]
	cmp	w5, w4
	bne	.L8
	cmp	x2, 5
	beq	.L15
	ldrb	w5, [x0, 5]
	ldrb	w4, [x1, 5]
	cmp	w5, w4
	bne	.L8
	cmp	x2, 7
	bne	.L26
	ldrb	w5, [x0, 6]
	ldrb	w4, [x1, 6]
	cmp	w5, w4
	bne	.L8
.L15:
	mov	x7, x2
.L16:
	ldr	d31, [x0, x2]
	add	x6, x0, x2
	ldr	d30, [x1, x2]
	add	x5, x1, x2
	cmeq	v31.8b, v31.8b, v30.8b
	not	v31.8b, v31.8b
	fmov	x4, d31
	cbnz	x4, .L27
	sub	x2, x3, x2
	lsr	x4, x2, 3
	cmp	x4, 2
	bne	.L18
	ldr	d30, [x5, 8]
	ldr	d31, [x6, 8]
	cmeq	v31.8b, v31.8b, v30.8b
	not	v31.8b, v31.8b
	fmov	x5, d31
	cbnz	x5, .L44
.L18:
	ubfiz	x4, x4, 3, 32
	cmp	x2, x4
	bne	.L45
	.p2align 5,,15
.L7:
	mov	w0, 1
.L47:
	ret
	.p2align 2,,3
.L11:
	ldr	x2, [x0]
	sub	x3, x3, #8
	ldr	x4, [x1]
	add	x0, x0, 8
	add	x1, x1, 8
	cmp	x4, x2
	bne	.L8
	cmp	x3, 7
	bhi	.L11
	cbz	x3, .L7
.L12:
	mov	x2, 0
	b	.L20
	.p2align 2,,3
.L46:
	cmp	x3, x2
	bls	.L7
.L20:
	ldrb	w5, [x0, x2]
	ldrb	w4, [x1, x2]
	add	x2, x2, 1
	cmp	w5, w4
	beq	.L46
	mov	w0, 0
	b	.L5
.L22:
	mov	x2, 0
	mov	x4, 1
	.p2align 5,,15
.L14:
	ldrb	w5, [x1, x4]
	ldrb	w4, [x0, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 2
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x1, x4]
	ldrb	w4, [x0, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 3
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 4
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 5
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 6
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 7
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 8
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 9
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 10
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 11
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 12
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 13
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 14
	cmp	x3, x4
	bls	.L7
	ldrb	w5, [x0, x4]
	ldrb	w4, [x1, x4]
	cmp	w5, w4
	bne	.L8
	add	x2, x2, 15
	cmp	x3, x2
	bls	.L7
	ldrb	w3, [x0, x2]
	ldrb	w0, [x1, x2]
	cmp	w3, w0
	cset	w0, eq
	ret
.L21:
	mov	w0, -2
	ret
.L27:
	mov	x2, 0
.L17:
	add	x2, x7, x2
.L19:
	ldrb	w5, [x0, x2]
	ldrb	w4, [x1, x2]
	cmp	w5, w4
	bne	.L8
	add	x4, x2, 1
	cmp	x3, x4
	bhi	.L14
	mov	w0, 1
	b	.L47
.L44:
	mov	x2, 8
	b	.L17
.L23:
	mov	x7, 1
	b	.L16
.L24:
	mov	x7, 2
	b	.L16
.L25:
	mov	x7, 3
	b	.L16
.L26:
	mov	x7, 6
	b	.L16
.L45:
	add	x2, x7, x4
	b	.L19
	.cfi_endproc
.LFE4084:
	.size	probe_equal, .-probe_equal
	.ident	"GCC: (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
