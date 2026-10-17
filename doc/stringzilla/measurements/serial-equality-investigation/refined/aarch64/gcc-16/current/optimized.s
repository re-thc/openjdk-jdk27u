	.arch armv8-a
	.file	"wrapper.c"
	.text
	.align	2
	.p2align 5,,15
	.global	current_initialize
	.type	current_initialize, %function
current_initialize:
.LFB4081:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4081:
	.size	current_initialize, .-current_initialize
	.align	2
	.p2align 5,,15
	.global	current_capabilities
	.type	current_capabilities, %function
current_capabilities:
.LFB4082:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4082:
	.size	current_capabilities, .-current_capabilities
	.align	2
	.p2align 5,,15
	.global	current_register
	.type	current_register, %function
current_register:
.LFB4083:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE4083:
	.size	current_register, .-current_register
	.align	2
	.p2align 5,,15
	.global	current_equal
	.type	current_equal, %function
current_equal:
.LFB4084:
	.cfi_startproc
	cmp	w2, 65536
	bhi	.L33
	sxtw	x2, w2
	add	x7, x0, x2
	cmp	x0, x7
	beq	.L52
	sub	x5, x2, #1
	cmp	x5, 29
	bls	.L13
	eor	x3, x0, x1
	tst	x3, 15
	bne	.L13
	neg	x4, x1
	and	x3, x4, 15
	add	x6, x3, 16
	cmp	x5, x6
	bcc	.L11
	cbz	x3, .L35
	ldrb	w6, [x0]
	ldrb	w5, [x1]
	cmp	w6, w5
	bne	.L10
	add	x6, x0, 1
	add	x8, x1, 1
	tst	x4, 14
	beq	.L17
	ldrb	w8, [x1, 1]
	ldrb	w5, [x0, 1]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 2
	add	x8, x1, 2
	cmp	x3, 2
	bls	.L17
	ldrb	w8, [x1, 2]
	ldrb	w5, [x0, 2]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 3
	add	x8, x1, 3
	tst	x4, 12
	beq	.L17
	ldrb	w8, [x1, 3]
	ldrb	w5, [x0, 3]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 4
	add	x8, x1, 4
	cmp	x3, 4
	bls	.L17
	ldrb	w8, [x0, 4]
	ldrb	w5, [x1, 4]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 5
	add	x8, x1, 5
	cmp	x3, 5
	beq	.L17
	ldrb	w8, [x0, 5]
	ldrb	w5, [x1, 5]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 6
	add	x8, x1, 6
	cmp	x3, 6
	beq	.L17
	ldrb	w8, [x0, 6]
	ldrb	w5, [x1, 6]
	cmp	w8, w5
	bne	.L49
	add	x6, x0, 7
	add	x8, x1, 7
	tbz	x4, 3, .L17
	ldrb	w5, [x0, 7]
	ldrb	w4, [x1, 7]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 8
	add	x8, x1, 8
	cmp	x3, 8
	beq	.L17
	ldrb	w5, [x0, 8]
	ldrb	w4, [x1, 8]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 9
	add	x8, x1, 9
	cmp	x3, 9
	beq	.L17
	ldrb	w5, [x0, 9]
	ldrb	w4, [x1, 9]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 10
	add	x8, x1, 10
	cmp	x3, 10
	beq	.L17
	ldrb	w5, [x0, 10]
	ldrb	w4, [x1, 10]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 11
	add	x8, x1, 11
	cmp	x3, 11
	beq	.L17
	ldrb	w5, [x0, 11]
	ldrb	w4, [x1, 11]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 12
	add	x8, x1, 12
	cmp	x3, 12
	beq	.L17
	ldrb	w5, [x0, 12]
	ldrb	w4, [x1, 12]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 13
	add	x8, x1, 13
	cmp	x3, 13
	beq	.L17
	ldrb	w5, [x0, 13]
	ldrb	w4, [x1, 13]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 14
	add	x8, x1, 14
	cmp	x3, 15
	bne	.L17
	ldrb	w5, [x0, 14]
	ldrb	w4, [x1, 14]
	cmp	w5, w4
	bne	.L49
	add	x6, x0, 15
	add	x8, x1, 15
.L17:
	adrp	x4, .LANCHOR0
	dup	v30.2d, x6
	sub	x5, x2, x3
	adrp	x9, .LC4
	ldr	q31, [x4, #:lo12:.LANCHOR0]
	add	x0, x0, x3
	ldr	q27, [x9, #:lo12:.LC4]
	add	x3, x1, x3
	add	v30.2d, v30.2d, v31.2d
	lsr	x4, x5, 4
	mov	x1, 0
	mov	x2, 0
	b	.L8
	.p2align 2,,3
.L32:
	adds	x1, x1, 16
	cmp	x2, x4
	bcs	.L53
	add	v30.2d, v30.2d, v27.2d
.L8:
	ldr	q31, [x0, x1]
	add	x2, x2, 1
	ldr	q29, [x3, x1]
	cmeq	v31.16b, v31.16b, v29.16b
	not	v31.16b, v31.16b
	umaxp	v31.4s, v31.4s, v31.4s
	fmov	x9, d31
	cbz	x9, .L32
	add	x0, x6, x1
	add	x1, x8, x1
	add	x1, x1, 1
	ldrb	w2, [x1, -1]
	ldrb	w3, [x0]
	cmp	w3, w2
	bne	.L10
	.p2align 5,,15
.L54:
	add	x0, x0, 1
	cmp	x7, x0
	beq	.L10
.L11:
	ldrb	w2, [x1]
	add	x1, x1, 1
	ldrb	w3, [x0]
	cmp	w3, w2
	beq	.L54
.L10:
	cmp	x7, x0
	cset	w0, eq
.L5:
	ret
	.p2align 2,,3
.L55:
	add	x0, x0, 1
	cmp	x7, x0
	beq	.L10
.L13:
	ldrb	w2, [x1]
	add	x1, x1, 1
	ldrb	w3, [x0]
	cmp	w3, w2
	beq	.L55
	b	.L10
	.p2align 2,,3
.L49:
	mov	x0, x6
	cmp	x7, x0
	cset	w0, eq
	b	.L5
	.p2align 2,,3
.L53:
	ubfiz	x4, x4, 4, 32
	cmp	x5, x4
	beq	.L9
	add	x0, x6, x4
	add	x1, x8, x4
	b	.L11
.L52:
	mov	w0, 1
	ret
.L35:
	mov	x8, x1
	mov	x6, x0
	b	.L17
.L9:
	adrp	x0, .LC3
	ldr	q31, [x0, #:lo12:.LC3]
	add	v30.2d, v30.2d, v31.2d
	umov	x0, v30.d[1]
	b	.L10
.L33:
	mov	w0, -2
	ret
	.cfi_endproc
.LFE4084:
	.size	current_equal, .-current_equal
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
.LC2:
	.xword	0
	.xword	1
.LC3:
	.xword	15
	.xword	15
.LC4:
	.xword	16
	.xword	16
	.ident	"GCC: (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
