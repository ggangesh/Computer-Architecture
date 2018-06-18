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
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	sw	$16,28($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	lw	$2,48($fp)
	#nop
	bgtz	$2,$L2
	li	$2,1			# 0x1
	b	$L3
$L2:
	lw	$3,48($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L4
	lw	$2,40($fp)
	b	$L3
$L4:
	lw	$3,48($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L5
	lw	$2,44($fp)
	b	$L3
$L5:
	lw	$2,48($fp)
	#nop
	addiu	$2,$2,-1
	lw	$4,40($fp)
	lw	$5,44($fp)
	move	$6,$2
	jal	fibonacci
	move	$16,$2
	lw	$2,48($fp)
	#nop
	addiu	$2,$2,-2
	lw	$4,40($fp)
	lw	$5,44($fp)
	move	$6,$2
	jal	fibonacci
	addu	$2,$16,$2
$L3:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	lw	$16,28($sp)
	addiu	$sp,$sp,40
	j	$31
	.end	fibonacci
	.size	fibonacci, .-fibonacci
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	li	$4,1			# 0x1
	li	$5,2			# 0x2
	li	$6,10			# 0xa
	jal	fibonacci
	sw	$2,24($fp)
	lw	$4,24($fp)
	jal	syscall_print_int
	jal	syscall_print_newline
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7"
