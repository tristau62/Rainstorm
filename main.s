	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r2, .L7
	sub	sp, sp, #32
	ldr	r1, [r2, #4]
	ldr	r3, .L7+4
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #23
	mov	r1, r1, lsr #23
	ldr	r2, .L7+8
	strh	r0, [r3, #0]	@ movhi
	mov	r0, #0	@ movhi
	orr	r1, r1, #16384
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r4, r3
	add	r5, r2, #320
	mov	r1, r3
.L2:
	ldr	r0, [r2, #36]
	ldrb	ip, [r2, #32]	@ zero_extendqisi2
	add	r2, r2, #32
	bic	r0, r0, #65024
	mov	r6, #192	@ movhi
	cmp	r2, r5
	strh	ip, [r1, #8]	@ movhi
	strh	r0, [r1, #10]	@ movhi
	strh	r6, [r1, #12]	@ movhi
	add	r1, r1, #8
	bne	.L2
	mov	r5, #256
	ldr	r1, .L7+12
	mov	r2, #0
	add	r5, r5, #1
.L3:
	add	r0, r1, r2
	ldr	r0, [r0, #4]
	ldrb	ip, [r1, r2]	@ zero_extendqisi2
	add	r2, r2, #32
	bic	r0, r0, #65024
	cmp	r2, #96
	strh	ip, [r4, #88]	@ movhi
	strh	r0, [r4, #90]	@ movhi
	strh	r5, [r4, #92]	@ movhi
	add	r4, r4, #8
	bne	.L3
	ldr	r0, .L7+16
	ldr	r1, .L7+20
	ldr	fp, [r0, #4]
	ldr	r7, .L7+24
	str	fp, [sp, #0]
	ldr	r2, .L7+28
	ldr	fp, [r1, #4]
	ldr	r9, [r7, #4]
	ldr	r5, .L7+32
	ldrb	r7, [r7, #0]	@ zero_extendqisi2
	str	fp, [sp, #20]
	ldr	fp, [r2, #4]
	ldr	sl, [r5, #4]
	str	r7, [sp, #8]
	ldrb	r5, [r5, #0]	@ zero_extendqisi2
	ldr	r7, [sp, #20]
	ldr	r4, .L7+36
	str	fp, [sp, #28]
	ldr	r8, [r4, #4]
	str	r5, [sp, #12]
	ldrb	r4, [r4, #0]	@ zero_extendqisi2
	ldrb	r5, [r0, #0]	@ zero_extendqisi2
	bic	fp, r7, #65024
	ldr	r0, [sp, #0]
	ldr	r7, [sp, #28]
	str	r4, [sp, #16]
	bic	r4, r0, #65024
	bic	r0, r7, #65024
	ldr	r7, [sp, #8]
	strh	r7, [r3, #112]	@ movhi
	mov	r7, #224	@ movhi
	strh	r7, [r3, #116]	@ movhi
	ldr	r7, [sp, #12]
	ldr	ip, .L7+40
	strh	r7, [r3, #120]	@ movhi
	mov	r7, #225	@ movhi
	ldr	r6, [ip, #4]
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	ldrb	ip, [ip, #0]	@ zero_extendqisi2
	strh	r7, [r3, #124]	@ movhi
	ldr	r7, [sp, #16]
	bic	r9, r9, #65024
	bic	sl, sl, #65024
	str	ip, [sp, #4]
	str	r2, [sp, #24]
	ldrb	ip, [r1, #0]	@ zero_extendqisi2
	bic	r6, r6, #65024
	strh	r9, [r3, #114]	@ movhi
	strh	sl, [r3, #122]	@ movhi
	strh	r7, [r3, #128]	@ movhi
	strh	r0, [r3, #162]	@ movhi
	ldr	r0, .L7+44
	strh	r6, [r3, #146]	@ movhi
	mov	r6, #227	@ movhi
	mov	r7, #226	@ movhi
	strh	r6, [r3, #148]	@ movhi
	strh	ip, [r3, #152]	@ movhi
	ldr	r6, [r0, #0]
	ldr	ip, [sp, #24]
	ldr	r0, .L7+48
	strh	r7, [r3, #132]	@ movhi
	ldr	r7, [sp, #4]
	ldr	r1, .L7+52
	ldr	r2, .L7+56
	strh	ip, [r3, #160]	@ movhi
	ldr	ip, [r0, #0]
	ldr	r0, .L7+60
	bic	r8, r8, #65024
	strh	r7, [r3, #144]	@ movhi
	mov	r7, #228	@ movhi
	strh	r8, [r3, #130]	@ movhi
	strh	r4, [r3, #138]	@ movhi
	ldr	r8, [r2, #4]
	ldr	r4, [r1, #4]
	strh	r7, [r3, #140]	@ movhi
	ldr	r7, [r0, #0]
	strh	r5, [r3, #136]	@ movhi
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	ldrb	r5, [r1, #0]	@ zero_extendqisi2
	strh	fp, [r3, #154]	@ movhi
	add	r6, r6, #160
	mov	fp, #229	@ movhi
	bic	r4, r4, #65024
	add	ip, ip, #160
	bic	r1, r8, #65024
	add	r2, r7, #160
	strh	fp, [r3, #156]	@ movhi
	strh	r6, [r3, #164]	@ movhi
	strh	r5, [r3, #168]	@ movhi
	strh	r4, [r3, #170]	@ movhi
	strh	ip, [r3, #172]	@ movhi
	strh	r0, [r3, #176]	@ movhi
	strh	r1, [r3, #178]	@ movhi
	strh	r2, [r3, #180]	@ movhi
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	shadowOAM
	.word	raindrop
	.word	money
	.word	e
	.word	colon
	.word	s
	.word	hundreds
	.word	c
	.word	o
	.word	r2
	.word	scoreHundreds
	.word	scoreTens
	.word	tens
	.word	ones
	.word	scoreOnes
	.size	updateOAM, .-updateOAM
	.align	2
	.global	updateDrops
	.type	updateDrops, %function
updateDrops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	add	r1, r3, #320
.L10:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]!
	cmp	r3, r1
	bne	.L10
	ldr	r3, .L12+4
	ldr	r1, [r3, #0]
	ldr	r2, [r3, #32]
	add	r1, r1, #1
	add	r2, r2, #1
	str	r1, [r3, #0]
	str	r2, [r3, #32]
	bx	lr
.L13:
	.align	2
.L12:
	.word	raindrop
	.word	money
	.size	updateDrops, .-updateDrops
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L16
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L17:
	.align	2
.L16:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	beq	.L19
	ldr	r2, .L20
	ldr	r1, [r2, #0]
	add	r1, r1, #1
	str	r1, [r2, #0]
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L19:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	vbCountA
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #1024
	add	r3, r3, #4
	mov	r6, #67108864
	mov	r0, #251
	strh	r3, [r6, #0]	@ movhi
	ldr	r5, .L28
	mov	lr, pc
	bx	r5
	ldr	r3, .L28+4
	mov	lr, pc
	bx	r3
	mov	r0, #251
	ldr	r3, .L28+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+12
	ldr	r4, .L28+16
	ldmia	r3, {r0, r1, r2, r3}
	mov	ip, r4
	stmia	ip!, {r0, r1, r2}
	ldr	r7, .L28+20
	strb	r3, [ip, #0]
	mov	r0, #10
	mov	r1, #32
	mov	r2, r4
	mov	r3, #250
	mov	lr, pc
	bx	r7
	ldr	ip, .L28+24
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, r4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	mov	ip, r1, lsr #16
	mov	r2, r4
	str	r0, [lr, #0]
	strh	r1, [r4, #20]	@ movhi
	mov	r0, #20
	mov	r1, #32
	mov	r3, #250
	strb	ip, [r4, #22]
	mov	lr, pc
	bx	r7
	ldr	r1, .L28+28
	ldr	r0, .L28+32
	ldr	r2, [r1, #0]
.L23:
	ldr	r3, [r6, #304]
	tst	r2, #8
	str	r2, [r0, #0]
	str	r3, [r1, #0]
	beq	.L24
	tst	r3, #8
	beq	.L27
.L24:
	tst	r2, #1
	beq	.L26
	ands	r4, r3, #1
	bne	.L26
	mov	r0, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L28+36
	str	r4, [r3, #0]
.L22:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L26:
	mov	r2, r3
	b	.L23
.L27:
	mov	r0, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L28+36
	mov	r2, #2
	str	r2, [r3, #0]
	b	.L22
.L29:
	.align	2
.L28:
	.word	fillScreen4
	.word	flipPage
	.word	drawBackgroundImage4
	.word	.LC0
	.word	buffer
	.word	drawString4
	.word	.LC1
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	pause, .-pause
	.align	2
	.global	instruct
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r0, #251
	ldr	r8, .L34
	mov	lr, pc
	bx	r8
	mov	r2, #1024
	add	r2, r2, #4
	mov	r7, #67108864
	strh	r2, [r7, #0]	@ movhi
	mov	r3, #100663296
	ldr	r2, .L34+4
	add	r3, r3, #40960
	str	r3, [r2, #0]
	mov	r0, #251
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	mov	r3, #83886080
	add	r3, r3, #256
	mvn	r2, #32768
	strh	r2, [r3, #244]	@ movhi
	ldr	ip, .L34+12
	ldr	r4, .L34+16
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r5, r4
	stmia	r5!, {r0, r1, r2, r3}
	ldr	ip, [ip, #0]
	ldr	r6, .L34+20
	mov	lr, ip, lsr #16
	mov	r0, #10
	mov	r1, #32
	mov	r2, r4
	mov	r3, #252
	strh	ip, [r5, #0]	@ movhi
	strb	lr, [r4, #18]
	mov	lr, pc
	bx	r6
	ldr	ip, .L34+24
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, r4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	mov	r3, r5
	stmia	r3!, {r0, r1}
	mov	ip, r2, lsr #16
	strh	r2, [r3, #0]	@ movhi
	mov	r0, #50
	mov	r1, #32
	mov	r2, r4
	mov	r3, #250
	strb	ip, [r4, #26]
	mov	lr, pc
	bx	r6
	ldr	ip, .L34+28
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, r4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2}
	mov	r3, r5
	stmia	r3!, {r0, r1}
	mov	r1, r3
	strb	r2, [r1, #0]
	mov	r3, #250
	mov	r0, #60
	mov	r1, #32
	mov	r2, r4
	mov	lr, pc
	bx	r6
	ldr	ip, .L34+32
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, r4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	mov	r2, r4
	str	r0, [r5, #0]
	strh	r1, [r4, #20]	@ movhi
	mov	r0, #70
	mov	r1, #32
	mov	r3, #250
	mov	lr, pc
	bx	r6
	ldr	lr, .L34+36
	ldmia	lr!, {r0, r1, r2, r3}
	mov	ip, r4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	mov	r0, #110
	mov	r1, #32
	mov	r2, r4
	strh	r3, [ip, #0]	@ movhi
	mov	r3, #250
	mov	lr, pc
	bx	r6
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+44
	mov	lr, pc
	bx	r3
	ldr	r1, .L34+48
	ldr	r0, .L34+52
	ldr	r2, [r1, #0]
.L31:
	ldr	r3, [r7, #304]
	tst	r2, #8
	str	r2, [r0, #0]
	str	r3, [r1, #0]
	beq	.L32
	tst	r3, #8
	beq	.L33
.L32:
	mov	r2, r3
	b	.L31
.L33:
	mov	r0, #251
	mov	lr, pc
	bx	r8
	ldr	r3, .L34+56
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	fillScreen4
	.word	videoBuffer
	.word	drawBackgroundImage4
	.word	.LC2
	.word	buffer
	.word	drawString4
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	waitForVblank
	.word	flipPage
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	instruct, .-instruct
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r8, .L42
	mov	lr, pc
	bx	r8
	ldr	r5, .L42+4
	mov	r0, #251
	mov	lr, pc
	bx	r5
	mov	r2, #1024
	add	r2, r2, #4
	mov	sl, #67108864
	strh	r2, [sl, #0]	@ movhi
	mov	r3, #100663296
	ldr	r2, .L42+8
	add	r3, r3, #40960
	str	r3, [r2, #0]
	ldr	r0, .L42+12
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L42+20
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+28
	ldr	r4, .L42+32
	ldmia	r3, {r0, r1, r2}
	mov	r3, r4
	stmia	r3!, {r0, r1}
	ldr	r7, .L42+36
	strh	r2, [r3, #0]	@ movhi
	mov	r0, #60
	mov	r1, #100
	mov	r2, r4
	mov	r3, #255
	mov	lr, pc
	bx	r7
	ldr	ip, .L42+40
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r6, r4
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	mov	r2, r4
	stmia	r6, {r0, r1}
	mov	r3, #0
	mov	r0, #100
	mov	r1, #32
	mov	lr, pc
	bx	r7
	ldr	lr, .L42+44
	ldmia	lr!, {r0, r1, r2, r3}
	mov	ip, r4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	mov	r0, #110
	mov	r1, #32
	strh	r3, [ip, #0]	@ movhi
	mov	r2, r4
	mov	r3, #0
	mov	lr, pc
	bx	r7
	ldr	r3, .L42+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r8
	ldr	r1, .L42+52
	ldr	r0, .L42+56
	ldr	r3, [r1, #0]
.L37:
	ldr	r2, [sl, #304]
	tst	r3, #8
	str	r3, [r0, #0]
	str	r2, [r1, #0]
	beq	.L38
	tst	r2, #8
	beq	.L41
.L38:
	tst	r3, #1
	beq	.L40
	tst	r2, #1
	bne	.L40
	mov	r0, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L42+60
	mov	r2, #1
	str	r2, [r3, #0]
.L36:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L40:
	mov	r3, r2
	b	.L37
.L41:
	mov	r0, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L42+60
	mov	r2, #2
	str	r2, [r3, #0]
	b	.L36
.L43:
	.align	2
.L42:
	.word	flipPage
	.word	fillScreen4
	.word	videoBuffer
	.word	splashPal
	.word	loadPalette
	.word	splashBitmap
	.word	drawBackgroundImage4
	.word	.LC7
	.word	buffer
	.word	drawString4
	.word	.LC8
	.word	.LC9
	.word	waitForVblank
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	splash, .-splash
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r0, #251
	ldr	r6, .L48
	mov	lr, pc
	bx	r6
	ldr	r3, .L48+4
	ldr	r4, .L48+8
	ldmia	r3, {r0, r1}
	ldr	r5, .L48+12
	stmia	r4, {r0, r1}
	mov	r2, r4
	mov	r0, #10
	mov	r1, #32
	mov	r3, #250
	mov	lr, pc
	bx	r5
	ldr	r3, .L48+16
	ldmia	r3, {r0, r1, r2, r3}
	stmia	r4, {r0, r1, r2, r3}
	mov	r0, #20
	mov	r1, #42
	mov	r2, r4
	mov	r3, #250
	mov	lr, pc
	bx	r5
	ldr	ip, .L48+20
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, r4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	mov	ip, r1, lsr #16
	mov	r2, r4
	str	r0, [lr, #0]
	strh	r1, [r4, #20]	@ movhi
	mov	r0, #30
	mov	r1, #42
	strb	ip, [r4, #22]
	mov	r3, #250
	mov	lr, pc
	bx	r5
	ldr	r1, .L48+24
	ldr	ip, .L48+28
	ldr	r2, [r1, #0]
	mov	r0, #67108864
.L45:
	ldr	r3, [r0, #304]
	tst	r2, #8
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	beq	.L46
	ands	r4, r3, #8
	beq	.L47
.L46:
	mov	r2, r3
	b	.L45
.L47:
	mov	r0, #251
	mov	lr, pc
	bx	r6
	ldr	r3, .L48+32
	str	r4, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	fillScreen4
	.word	.LC10
	.word	buffer
	.word	drawString4
	.word	.LC11
	.word	.LC12
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r0, #251
	ldr	r5, .L54
	mov	lr, pc
	bx	r5
	ldr	r3, .L54+4
	ldr	r4, .L54+8
	ldmia	r3, {r0, r1, r2}
	mov	r3, r4
	stmia	r3!, {r0, r1}
	mov	r1, r3
	strb	r2, [r1, #0]
	mov	r3, #250
	mov	r0, #10
	mov	r1, #32
	mov	r2, r4
	ldr	r6, .L54+12
	mov	lr, pc
	bx	r6
	ldr	r3, .L54+16
	ldmia	r3, {r0, r1, r2, r3}
	stmia	r4, {r0, r1, r2, r3}
	mov	r0, #10
	mov	r1, #42
	mov	r2, r4
	mov	r3, #250
	mov	lr, pc
	bx	r6
	ldr	r1, .L54+20
	ldr	ip, .L54+24
	ldr	r2, [r1, #0]
	mov	r0, #67108864
.L51:
	ldr	r3, [r0, #304]
	tst	r2, #8
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	beq	.L52
	ands	r4, r3, #8
	beq	.L53
.L52:
	mov	r2, r3
	b	.L51
.L53:
	mov	r0, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L54+28
	str	r4, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	fillScreen4
	.word	.LC13
	.word	buffer
	.word	drawString4
	.word	.LC11
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	lose, .-lose
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L59
	mov	r3, #0
.L57:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L57
	bx	lr
.L60:
	.align	2
.L59:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L66
	mov	r2, #16
	ldr	r1, .L66+4
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #99
	ldr	r4, .L66+8
	mov	r0, #0
	str	r2, [r3, #0]
	mov	r2, #120
	str	r0, [r1, #0]
	str	r2, [r3, #4]
	ldr	r5, .L66+12
	ldr	r8, .L66+16
	ldr	r7, .L66+20
	add	r6, r4, #320
.L62:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, asl #4
	add	r3, r3, r2, asl #4
	rsb	r0, r3, r0
	str	r0, [r4, #36]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	str	r0, [r4, #32]!
	cmp	r4, r6
	bne	.L62
	ldr	r6, .L66+24
	ldr	r8, .L66+16
	ldr	r7, .L66+20
	mov	r4, #0
.L63:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, asl #4
	add	r3, r3, r2, asl #4
	rsb	r0, r3, r0
	add	r2, r6, r4
	str	r0, [r2, #4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	str	r0, [r6, r4]
	add	r4, r4, #32
	cmp	r4, #96
	bne	.L63
	ldr	r8, .L66+28
	mov	r3, #145
	ldr	r7, .L66+32
	mov	sl, #10
	ldr	r6, .L66+36
	stmia	r8, {r3, sl}	@ phole stm
	mov	r8, #18
	ldr	r5, .L66+40
	stmia	r7, {r3, r8}	@ phole stm
	mov	r7, #26
	ldr	r4, .L66+44
	stmia	r6, {r3, r7}	@ phole stm
	mov	r6, #34
	ldr	ip, .L66+48
	stmia	r5, {r3, r6}	@ phole stm
	mov	r5, #42
	ldr	r0, .L66+52
	ldr	r1, .L66+56
	ldr	r2, .L66+60
	stmia	r4, {r3, r5}	@ phole stm
	mov	r4, #50
	stmia	ip, {r3, r4}	@ phole stm
	mov	ip, #58
	stmia	r0, {r3, ip}	@ phole stm
	str	r3, [r1, #0]
	mov	r0, #66
	str	r3, [r2, #0]
	mov	r3, #74
	str	r0, [r1, #4]
	str	r3, [r2, #4]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	player
	.word	score
	.word	raindrop
	.word	rand
	.word	285143057
	.word	1717986919
	.word	money
	.word	s
	.word	c
	.word	o
	.word	r2
	.word	e
	.word	colon
	.word	hundreds
	.word	tens
	.word	ones
	.size	initialize, .-initialize
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L69
	ldr	ip, [r3, #0]
	mov	r6, #0
	add	ip, ip, #12
	str	r6, [ip, #8]
	ldr	ip, .L69+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r5, r2
	mov	r4, r1
	add	r2, r7, #160
	mov	r3, #910163968
	add	r7, r7, #256
	str	r6, [ip, #0]
	mov	r0, #1
	ldr	ip, .L69+8
	mov	r1, sl
	mov	lr, pc
	bx	ip
	ldr	r8, .L69+12
	mov	r1, r5
	strh	r6, [r7, #2]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r6, .L69+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #0]	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r5
	str	r4, [r6, #4]
	mov	r0, r0, asl #2
	strh	r3, [r7, #2]	@ movhi
	str	r5, [r6, #8]
	str	sl, [r6, #0]
	mov	lr, pc
	bx	r8
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	str	r5, [r6, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	dma
	.word	vbCountA
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L72
	ldr	ip, [r3, #0]
	mov	r6, #0
	add	ip, ip, #24
	str	r6, [ip, #8]
	ldr	ip, .L72+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r5, r2
	mov	r4, r1
	add	r2, r7, #164
	mov	r3, #910163968
	add	r7, r7, #256
	str	r6, [ip, #0]
	mov	r0, #2
	ldr	ip, .L72+8
	mov	r1, sl
	mov	lr, pc
	bx	ip
	ldr	r8, .L72+12
	mov	r1, r5
	strh	r6, [r7, #6]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r6, .L72+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #4]	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r5
	str	r4, [r6, #4]
	mov	r0, r0, asl #2
	strh	r3, [r7, #6]	@ movhi
	str	r5, [r6, #8]
	str	sl, [r6, #0]
	mov	lr, pc
	bx	r8
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	str	r5, [r6, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	dma
	.word	vbCountB
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L80
	ldr	r5, .L80+4
	ldr	r6, .L80+8
	add	r7, r4, #640
.L77:
	add	r2, r4, #32
	ldmia	r2, {r2, r3}	@ phole ldm
	ldmia	r5, {r0, r1}	@ phole ldm
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #32
	bne	.L79
	cmp	r4, r7
	bne	.L77
.L74:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L79:
	mov	r0, #251
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+16
	ldr	r0, .L80+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+24
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L74
.L81:
	.align	2
.L80:
	.word	raindrop
	.word	player
	.word	checkHit
	.word	fillScreen4
	.word	loadPalette
	.word	splashPal
	.word	.LANCHOR0
	.size	collision, .-collision
	.align	2
	.global	updateNums
	.type	updateNums, %function
updateNums:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L83
	stmfd	sp!, {r4, r5}
	ldr	r0, .L83+4
	ldr	r2, [r3, #0]
	smull	r1, r3, r0, r2
	ldr	r1, .L83+8
	smull	ip, r1, r2, r1
	mov	ip, r2, asr #31
	rsb	r3, ip, r3, asr #2
	rsb	r1, ip, r1, asr #5
	smull	ip, r5, r0, r1
	smull	ip, r0, r3, r0
	mov	r4, r3, asr #31
	mov	ip, r1, asr #31
	rsb	r0, r4, r0, asr #2
	add	r0, r0, r0, asl #2
	rsb	ip, ip, r5, asr #2
	add	r4, r3, r3, asl #2
	add	ip, ip, ip, asl #2
	sub	r3, r3, r0, asl #1
	ldr	r0, .L83+12
	sub	r1, r1, ip, asl #1
	str	r1, [r0, #0]
	ldr	r1, .L83+16
	str	r3, [r1, #0]
	ldr	r3, .L83+20
	sub	r2, r2, r4, asl #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L84:
	.align	2
.L83:
	.word	score
	.word	1717986919
	.word	1374389535
	.word	scoreHundreds
	.word	scoreTens
	.word	scoreOnes
	.size	updateNums, .-updateNums
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, #4352	@ movhi
	mov	r3, #67108864
	mov	r2, #7040	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L116
	ldr	r3, .L116+4
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L116+8
	mov	r2, #100663296
	mov	r3, #736
	ldr	ip, .L116+12
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L116+16
	add	r2, r2, #55296
	mov	r3, #1024
	ldr	ip, .L116+12
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L116+20
	add	r2, r2, #65536
	mov	r3, #16384
	ldr	ip, .L116+12
	mov	lr, pc
	bx	ip
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L116+24
	ldr	ip, .L116+12
	mov	lr, pc
	bx	ip
	ldr	r2, .L116+28
	mov	r3, #0
.L86:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L86
	bl	initialize
	ldr	r6, .L116+32
	ldr	r9, .L116+36
.L99:
	ldr	r3, .L116+40
	ldr	r2, [r3, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldr	ip, .L116+44
	ldr	r1, .L116+40
	ldr	r8, .L116+48
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	ldr	r2, .L116+52
	mov	lr, pc
	bx	r2
	mov	r4, r8
	b	.L88
.L87:
	ldr	ip, .L116+56
	add	r4, r4, #32
	cmp	r4, ip
	beq	.L111
.L88:
	ldr	r3, [r4, #32]
	cmp	r3, #105
	ble	.L87
	mov	lr, pc
	bx	r9
	ldr	r3, .L116+60
	smull	ip, r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	str	r0, [r4, #32]
	mov	lr, pc
	bx	r9
	ldr	r1, .L116+64
	smull	r3, r2, r1, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, asl #4
	add	r3, r3, r2, asl #4
	rsb	r0, r3, r0
	ldr	ip, .L116+56
	str	r0, [r4, #36]
	add	r4, r4, #32
	cmp	r4, ip
	bne	.L88
.L111:
	mov	r4, #0
.L90:
	ldr	r3, [r6, r4]
	cmp	r3, #105
	add	r5, r6, r4
	bgt	.L112
.L89:
	add	r4, r4, #32
	cmp	r4, #96
	bne	.L90
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L91
	ldr	r3, .L116+68
	ldr	r2, [r3, #4]
	cmp	r2, #0
	subne	r2, r2, #1
	strne	r2, [r3, #4]
.L91:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L92
	ldr	r3, .L116+68
	ldr	r2, [r3, #4]
	cmp	r2, #224
	addne	r2, r2, #1
	strne	r2, [r3, #4]
.L92:
	ldr	r2, .L116+44
	ldr	r3, [r2, #0]
	tst	r3, #8
	beq	.L93
	ldr	ip, .L116+40
	ldr	r2, [ip, #0]
	tst	r2, #8
	beq	.L113
.L93:
	tst	r3, #4
	beq	.L110
	ldr	r1, .L116+40
	ldr	r3, [r1, #0]
	ands	r4, r3, #4
	beq	.L109
.L110:
	ldr	r5, .L116+68
	ldr	sl, .L116+72
	ldr	fp, .L116+76
.L102:
	ldmia	r5, {r0, r1}	@ phole ldm
	add	r2, r8, #32
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	lr, pc
	bx	sl
	subs	r4, r0, #0
	bne	.L114
.L98:
	add	r7, r6, r4
	ldr	r2, [r6, r4]
	ldr	r1, [r5, #4]
	ldr	r3, [r7, #4]
	ldr	r0, [r5, #0]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	bne	.L115
.L97:
	add	r4, r4, #32
	cmp	r4, #96
	bne	.L98
	ldr	r1, .L116+56
	add	r8, r8, #32
	cmp	r1, r8
	bne	.L102
	bl	updateDrops
	bl	updateNums
	mov	r0, #3
	ldr	r1, .L116+28
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L116+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L116+80
	mov	lr, pc
	bx	r3
	b	.L99
.L115:
	mov	lr, pc
	bx	r9
	ldr	ip, .L116+60
	smull	r1, r2, ip, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	str	r0, [r6, r4]
	mov	lr, pc
	bx	r9
	ldr	r3, .L116+64
	smull	ip, r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r1, r3, r3, asl #4
	ldr	r2, [fp, #0]
	add	r3, r3, r1, asl #4
	rsb	r0, r3, r0
	add	r2, r2, #1
	str	r0, [r7, #4]
	str	r2, [fp, #0]
	b	.L97
.L112:
	mov	lr, pc
	bx	r9
	ldr	r1, .L116+60
	smull	r3, r2, r1, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	str	r0, [r6, r4]
	mov	lr, pc
	bx	r9
	ldr	ip, .L116+64
	smull	r1, r2, ip, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, asl #4
	add	r3, r3, r2, asl #4
	rsb	r0, r3, r0
	str	r0, [r5, #4]
	b	.L89
.L114:
	mov	r0, #251
	ldr	r3, .L116+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+4
	ldr	r0, .L116+88
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+92
	mov	r2, #0
	str	r2, [r3, #0]
.L85:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L113:
	ldr	r3, .L116+84
	mov	r0, #251
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+92
	mov	r2, #3
	str	r2, [r3, #0]
	b	.L85
.L109:
	ldr	r3, .L116+84
	mov	r0, #251
	mov	lr, pc
	bx	r3
	ldr	r0, .L116+88
	ldr	r2, .L116+4
	mov	lr, pc
	bx	r2
	ldr	r3, .L116+92
	str	r4, [r3, #0]
	b	.L85
.L117:
	.align	2
.L116:
	.word	housePal
	.word	loadPalette
	.word	houseTiles
	.word	DMANow
	.word	houseMap
	.word	Pikachu7Tiles
	.word	Pikachu7Pal
	.word	shadowOAM
	.word	money
	.word	rand
	.word	buttons
	.word	oldButtons
	.word	raindrop
	.word	updateOAM
	.word	raindrop+320
	.word	1717986919
	.word	285143057
	.word	player
	.word	checkHit
	.word	score
	.word	waitForVblank
	.word	fillScreen4
	.word	splashPal
	.word	.LANCHOR0
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r0, .L131
	ldr	r3, .L131+4
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	add	r2, r2, #4
	mov	r3, #83886080
	mov	r5, #67108864
	add	r3, r3, #256
	strh	r2, [r5, #0]	@ movhi
	mvn	r2, #32768
	strh	r2, [r3, #244]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #246]	@ movhi
	mov	r2, #31	@ movhi
	strh	r2, [r3, #248]	@ movhi
	mov	r2, #31744	@ movhi
	strh	r2, [r3, #242]	@ movhi
	bl	setupInterrupts
	bl	setupSounds
	ldr	r4, .L131+8
	ldr	r7, .L131+12
	ldr	r6, .L131+16
.L130:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L120:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L120
.L127:
	.word	.L121
	.word	.L122
	.word	.L123
	.word	.L124
	.word	.L125
	.word	.L126
.L122:
	bl	instruct
.L123:
	bl	game
	b	.L130
.L121:
	bl	splash
	b	.L130
.L126:
	bl	lose
	b	.L130
.L125:
	bl	win
	b	.L130
.L124:
	bl	pause
	b	.L130
.L132:
	.align	2
.L131:
	.word	splashPal
	.word	loadPalette
	.word	buttons
	.word	.LANCHOR0
	.word	oldButtons
	.size	main, .-main
	.global	state
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	player,32,4
	.comm	s,32,4
	.comm	c,32,4
	.comm	o,32,4
	.comm	r2,32,4
	.comm	e,32,4
	.comm	colon,32,4
	.comm	hundreds,32,4
	.comm	tens,32,4
	.comm	ones,32,4
	.comm	raindrop,352,4
	.comm	money,64,4
	.comm	score,4,4
	.comm	scoreOnes,4,4
	.comm	scoreTens,4,4
	.comm	scoreHundreds,4,4
	.comm	temp,4,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	buffer,41,4
	.comm	shadowOAM,1024,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Pause Screen\000"
	.space	3
.LC1:
	.ascii	"Press Start to unpause\000"
	.space	1
.LC2:
	.ascii	"Instruction screen\000"
	.space	1
.LC3:
	.ascii	"Use the arrow keys to move\000"
	.space	1
.LC4:
	.ascii	"Try to collect the money\000"
	.space	3
.LC5:
	.ascii	"Try to avoid the rain\000"
	.space	2
.LC6:
	.ascii	"Press Start to begin the game\000"
	.space	2
.LC7:
	.ascii	"RAINSTORM\000"
	.space	2
.LC8:
	.ascii	"Press A for information\000"
.LC9:
	.ascii	"Press start to start the game\000"
	.space	2
.LC10:
	.ascii	"You Win\000"
.LC11:
	.ascii	"Congratulations\000"
.LC12:
	.ascii	"Press start to restart\000"
	.space	1
.LC13:
	.ascii	"You lose\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
