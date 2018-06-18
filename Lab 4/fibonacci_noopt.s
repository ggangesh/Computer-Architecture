	.file	1 "fibonacci.c"
	.text
	.align	2
	.globl	fibonacci
	.set	nomips16
	.ent	fibonacci
fibonacci:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	sw	$16,28($sp)
	move	$fp,$sp
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
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
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

syscall_print_int:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li	$v0, 1
	# Using $a0 as argument
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr	$ra
	nop

syscall_print_newline:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li	$v0, 4
	la	$a0, newline
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	nop


.data
newline: .asciiz	"\n"
.align 2
result: .space 4

