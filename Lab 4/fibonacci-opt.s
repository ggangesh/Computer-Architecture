	.file	1 "fibonacci.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	fibonacci
	.set	nomips16
	.ent	fibonacci
	.type	fibonacci, @function
fibonacci:
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	move	$17,$4
	move	$19,$5
	.set	noreorder
	.set	nomacro
	bgtz	$6,$L2
	move	$18,$6
	.set	macro
	.set	reorder

	.set	noreorder
	.set	nomacro
	b	$L3
	li	$17,1			# 0x1
	.set	macro
	.set	reorder

$L2:
	li	$2,1			# 0x1
	.set	noreorder
	.set	nomacro
	beq	$6,$2,$L3
	li	$2,2			# 0x2
	.set	macro
	.set	reorder

	bne	$6,$2,$L4
	.set	noreorder
	.set	nomacro
	b	$L3
	move	$17,$5
	.set	macro
	.set	reorder

$L4:
	addiu	$6,$6,-1
	jal	fibonacci
	move	$16,$2
	move	$4,$17
	move	$5,$19
	addiu	$6,$18,-2
	jal	fibonacci
	addu	$17,$2,$16
$L3:
	move	$2,$17
	lw	$31,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	.set	noreorder
	.set	nomacro
	j	$31
	addiu	$sp,$sp,48
	.set	macro
	.set	reorder

	.end	fibonacci
	.size	fibonacci, .-fibonacci
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
	li	$4,1			# 0x1
	li	$5,2			# 0x2
	li	$6,10			# 0xa
	jal	fibonacci
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
