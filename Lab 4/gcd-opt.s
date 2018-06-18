	.file	1 "gcd.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	gcd
	.set	nomips16
	.ent	gcd
	.type	gcd, @function
gcd:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	.set	noreorder
	.set	nomacro
	bne	$4,$5,$L7
	move	$2,$4
	.set	macro
	.set	reorder

	j	$31
$L5:
	.set	noreorder
	.set	nomacro
	bne	$5,$2,$L9
	slt	$3,$5,$2
	.set	macro
	.set	reorder

	j	$31
$L7:
	slt	$3,$5,$2
$L9:
	beq	$3,$0,$L4
	.set	noreorder
	.set	nomacro
	b	$L5
	subu	$2,$2,$5
	.set	macro
	.set	reorder

$L4:
	.set	noreorder
	.set	nomacro
	b	$L5
	subu	$5,$5,$2
	.set	macro
	.set	reorder

	.end	gcd
	.size	gcd, .-gcd
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	.cprestore	16
	li	$4,10			# 0xa
	li	$5,75			# 0x4b
	jal	gcd
	move	$4,$2
	jal	syscall_print_int
	jal	syscall_print_newline
	lw	$31,28($sp)
	#nop
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,32
	.set	macro
	.set	reorder

	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7"
