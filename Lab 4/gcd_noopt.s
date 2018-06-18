	.file	1 "gcd.c"
	.text
	.align	2
	.globl	gcd
	.set	nomips16
	.ent	gcd
gcd:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4  # didn’ tunderstand.
	.fmask	0x00000000,0	# didn’ tunderstand.
	.set	noreorder # didn’ tunderstand.
	.set	reorder	# didn’ tunderstand.
	addiu	$sp,$sp,-8	# stack frame down
	sw	$fp,4($sp) # store frame counter
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp) # store values in frame counter
$L5:
	lw	$3,8($fp)  # MAIN  LOOP for gcd 
	lw	$2,12($fp)
	#nop
	bne	$3,$2,$L2
	lw	$2,8($fp) # load from stack frame 
	move	$sp,$fp
	lw	$fp,4($sp )# store frame counter
	addiu	$sp,$sp,8 # stack frame up
	j	$31
$L2:
	lw	$3,8($fp)  #y
	lw	$2,12($fp)     # load from stack fram x 
	#nop
	slt	$2,$2,$3 	# compare x < y
	beq	$2,$0,$L3
	lw	$3,8($fp)
	lw	$2,12($fp)
	#nop
	subu	$2,$3,$2  # y = y - x
	sw	$2,8($fp)
	b	$L5
$L3:
	lw	$3,12($fp)    # x 
	lw	$2,8($fp)    # y
	#nop
	subu	$2,$3,$2  # x =- x - y
	sw	$2,12($fp)
	b	$L5
	.end	gcd
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	li	$2,10			# 0xa
	sw	$2,32($fp)
	li	$2,75			# 0x4b
	sw	$2,28($fp)  # stack valuse frame stofre
	lw	$4,32($fp)
	lw	$5,28($fp)
	jal	gcd      # call function gcd
	sw	$2,24($fp)
	lw	$4,24($fp)
	jal	syscall_print_int     # print n
	jal	syscall_print_newline # pint newline
	move	$sp,$fp
	lw	$31,44($sp)   #restore valuse again
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31    #bye Bye from main
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
