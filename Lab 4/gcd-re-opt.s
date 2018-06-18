	.file	1 "gcd.c"
	.text
	.align	2
	.globl	gcd
	.set	nomips16
	.ent	gcd
gcd:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
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
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
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
