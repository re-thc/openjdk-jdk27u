	.arch armv8-a
	.file	"wrapper.c"
	.text
	.align	2
	.p2align 5,,15
	.global	word_initialize
	.type	word_initialize, %function
word_initialize:
.LFB4081:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4081:
	.size	word_initialize, .-word_initialize
	.align	2
	.p2align 5,,15
	.global	word_capabilities
	.type	word_capabilities, %function
word_capabilities:
.LFB4082:
	.cfi_startproc
	mov	w0, 0
	ret
	.cfi_endproc
.LFE4082:
	.size	word_capabilities, .-word_capabilities
	.align	2
	.p2align 5,,15
	.global	word_register
	.type	word_register, %function
word_register:
.LFB4083:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE4083:
	.size	word_register, .-word_register
	.align	2
	.p2align 5,,15
	.global	word_equal
	.type	word_equal, %function
word_equal:
.LFB4084:
	.cfi_startproc
	cmp	w2, 65536
	bhi	.L35
	sxtw	x2, w2
	add	x7, x0, x2
	cmp	x2, 23
	bhi	.L8
.L7:
	cmp	x7, x0
	beq	.L11
	sub	x3, x7, x0
	sub	x5, x3, #1
	cmp	x5, 29
	bls	.L13
	eor	x2, x0, x1
	tst	x2, 15
	bne	.L13
	neg	x4, x1
	and	x2, x4, 15
	add	x6, x2, 16
	cmp	x5, x6
	bcc	.L12
	cbz	x2, .L38
	ldrb	w6, [x0]
	ldrb	w5, [x1]
	cmp	w6, w5
	bne	.L11
	add	x5, x0, 1
	add	x8, x1, 1
	tst	x4, 14
	beq	.L18
	ldrb	w8, [x1, 1]
	ldrb	w6, [x0, 1]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 2
	add	x8, x1, 2
	cmp	x2, 2
	bls	.L18
	ldrb	w8, [x1, 2]
	ldrb	w6, [x0, 2]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 3
	add	x8, x1, 3
	tst	x4, 12
	beq	.L18
	ldrb	w8, [x0, 3]
	ldrb	w6, [x1, 3]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 4
	add	x8, x1, 4
	cmp	x2, 4
	bls	.L18
	ldrb	w8, [x0, 4]
	ldrb	w6, [x1, 4]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 5
	add	x8, x1, 5
	cmp	x2, 5
	beq	.L18
	ldrb	w8, [x0, 5]
	ldrb	w6, [x1, 5]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 6
	add	x8, x1, 6
	cmp	x2, 6
	beq	.L18
	ldrb	w8, [x0, 6]
	ldrb	w6, [x1, 6]
	cmp	w8, w6
	bne	.L52
	add	x5, x0, 7
	add	x8, x1, 7
	tbz	x4, 3, .L18
	ldrb	w6, [x0, 7]
	ldrb	w4, [x1, 7]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 8
	add	x8, x1, 8
	cmp	x2, 8
	beq	.L18
	ldrb	w6, [x0, 8]
	ldrb	w4, [x1, 8]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 9
	add	x8, x1, 9
	cmp	x2, 9
	beq	.L18
	ldrb	w6, [x0, 9]
	ldrb	w4, [x1, 9]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 10
	add	x8, x1, 10
	cmp	x2, 10
	beq	.L18
	ldrb	w6, [x0, 10]
	ldrb	w4, [x1, 10]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 11
	add	x8, x1, 11
	cmp	x2, 11
	beq	.L18
	ldrb	w6, [x0, 11]
	ldrb	w4, [x1, 11]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 12
	add	x8, x1, 12
	cmp	x2, 12
	beq	.L18
	ldrb	w6, [x0, 12]
	ldrb	w4, [x1, 12]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 13
	add	x8, x1, 13
	cmp	x2, 13
	beq	.L18
	ldrb	w6, [x0, 13]
	ldrb	w4, [x1, 13]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 14
	add	x8, x1, 14
	cmp	x2, 15
	bne	.L18
	ldrb	w6, [x0, 14]
	ldrb	w4, [x1, 14]
	cmp	w6, w4
	bne	.L52
	add	x5, x0, 15
	add	x8, x1, 15
.L18:
	adrp	x4, .LANCHOR0
	dup	v30.2d, x5
	sub	x6, x3, x2
	adrp	x9, .LC3
	ldr	q31, [x4, #:lo12:.LANCHOR0]
	add	x3, x1, x2
	add	x0, x0, x2
	lsr	x4, x6, 4
	ldr	q27, [x9, #:lo12:.LC3]
	mov	x1, 0
	add	v30.2d, v30.2d, v31.2d
	mov	x2, 0
	b	.L9
	.p2align 2,,3
.L34:
	adds	x1, x1, 16
	cmp	x2, x4
	bcs	.L56
	add	v30.2d, v30.2d, v27.2d
.L9:
	ldr	q31, [x0, x1]
	add	x2, x2, 1
	ldr	q29, [x3, x1]
	cmeq	v31.16b, v31.16b, v29.16b
	not	v31.16b, v31.16b
	umaxp	v31.4s, v31.4s, v31.4s
	fmov	x9, d31
	cbz	x9, .L34
	add	x0, x5, x1
	add	x1, x8, x1
	add	x1, x1, 1
	ldrb	w2, [x1, -1]
	ldrb	w3, [x0]
	cmp	w3, w2
	bne	.L11
	.p2align 5,,15
.L57:
	add	x0, x0, 1
	cmp	x7, x0
	beq	.L11
.L12:
	ldrb	w2, [x1]
	add	x1, x1, 1
	ldrb	w3, [x0]
	cmp	w3, w2
	beq	.L57
.L11:
	cmp	x7, x0
	cset	w0, eq
.L5:
	ret
	.p2align 2,,3
.L58:
	cmp	x4, 7
	bls	.L7
.L8:
	ldr	x3, [x0]
	add	x0, x0, 8
	ldr	x2, [x1]
	sub	x4, x7, x0
	add	x1, x1, 8
	cmp	x3, x2
	beq	.L58
	mov	w0, 0
	ret
	.p2align 2,,3
.L59:
	add	x0, x0, 1
	cmp	x7, x0
	beq	.L11
.L13:
	ldrb	w2, [x1]
	add	x1, x1, 1
	ldrb	w3, [x0]
	cmp	w3, w2
	beq	.L59
	b	.L11
	.p2align 2,,3
.L35:
	mov	w0, -2
	ret
	.p2align 2,,3
.L52:
	mov	x0, x5
	cmp	x7, x0
	cset	w0, eq
	b	.L5
	.p2align 2,,3
.L56:
	lsl	x4, x4, 4
	cmp	x6, x4
	beq	.L10
	add	x0, x5, x4
	add	x1, x8, x4
	b	.L12
.L38:
	mov	x8, x1
	mov	x5, x0
	b	.L18
.L10:
	adrp	x0, .LC4
	ldr	q31, [x0, #:lo12:.LC4]
	add	v30.2d, v30.2d, v31.2d
	umov	x0, v30.d[1]
	b	.L11
	.cfi_endproc
.LFE4084:
	.size	word_equal, .-word_equal
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
.LC2:
	.xword	0
	.xword	1
.LC3:
	.xword	16
	.xword	16
.LC4:
	.xword	15
	.xword	15
	.ident	"GCC: (Ubuntu 16-20260322-1ubuntu1) 16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
