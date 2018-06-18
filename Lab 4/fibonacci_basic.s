.data

newline: .asciiz	"\n"
.align 2
result: .space 4

.text

.ent main

main:
	li $s0 , 1 #store first 
	li $s1 , 2 #store second
	li $s2 , 10 #store n

	addi $a0 , $s0 , 0 #pass a as argument
	addi $a1 , $s1 , 0 #pass b as argument
	addi $a2 , $s2 , 0 #pass b as argument

	jal fibonacci

	move $t0 , $v0 # store fibonacci in a

	addi $a0 , $t0 , 0

	jal syscall_print_int
	jal syscall_print_newline
	
	li $v0 , 10
		syscall

	.end main


.end main





####function

.ent fibonacci

fibonacci:

	addi $sp  , $sp , -16
	sw $ra , 0($sp)
	sw $a0 , 4($sp)
	sw $a1 , 8($sp)
	sw $a2 , 12($sp)
	

	addi $t0 , $a0 , 0 #local store first
	addi $t1 , $a1 , 0 #local store second
	addi $t2 , $a2 , 0 #local store n

	slti $t3 , $t2 , 1 # t3 =1 if n < 1
	bne $t3, $0, reminusone # IF T3 !=0 GOTO reminusone
	li $t3 , 1	# store 1 
	beq $t2, $t3 , refirst # IF T2 == t3 GOTO refirst
	li $t3 , 2  # store 1
	beq $t2, $t3 ,resecond # IF T2 == t3 GOTO refirst

	addi $a2 ,$t2 ,-1	# n- 1

	addi $sp  , $sp , -24
	sw $ra , 0($sp)
	sw $s3 , 4($sp)
	sw $s4 , 8($sp)
	sw $t0 , 12($sp)
	sw $t1 , 16($sp)
	sw $t2 , 20($sp)
	
	jal fibonacci

	lw $ra , 0($sp)
	lw $s3 , 4($sp)
	lw $s4 , 8($sp)
	lw $t0 , 12($sp)
	lw $t1 , 16($sp)
	lw $t2 , 20($sp)
	
	addi $sp  , $sp , 24
	

	move $s3, $v0 # store return fibonacci(n-1) 
	addi $a2 ,$t2 ,-2	# n- 2

	addi $sp  , $sp , -24
	sw $ra , 0($sp)
	sw $s3 , 4($sp)
	sw $s4 , 8($sp)
	sw $t0 , 12($sp)
	sw $t1 , 16($sp)
	sw $t2 , 20($sp)
	
	jal fibonacci

	lw $ra , 0($sp)
	lw $s3 , 4($sp)
	lw $s4 , 8($sp)
	lw $t0 , 12($sp)
	lw $t1 , 16($sp)
	lw $t2 , 20($sp)
	
	addi $sp  , $sp , 24


	move $s4, $v0 # store return fibonacci(n-2) 

	lw $ra , 0 ($sp) # restore return address
	sw $a0 , 4($sp)
	sw $a1 , 8($sp)
	sw $a2 , 12($sp)
	addi$sp , $sp , 16 # erase stack frame
	
	add $v0 , $s3  , $s4 # return fibonacci(n -1) + fibonacci(n)

	jr $ra
	reminusone:
		li $v0 , -1
		lw $ra , 0 ($sp) # restore return address
		sw $a0 , 4($sp)
		sw $a1 , 8($sp)
		sw $a2 , 12($sp)
		addi$sp , $sp , 16 # erase stack frame
		jr $ra

	refirst:
		addi $v0 , $t0 , 0 # return first
		lw $ra , 0 ($sp) # restore return address
		sw $a0 , 4($sp)
		sw $a1 , 8($sp)
		sw $a2 , 12($sp)
		addi$sp , $sp , 16 # erase stack frame
		
		jr $ra

	resecond:
		addi $v0 , $t1 , 0 # return second
		lw $ra , 0 ($sp) # restore return address
		sw $a0 , 4($sp)
		sw $a1 , 8($sp)
		sw $a2 , 12($sp)
		addi$sp , $sp , 16 # erase stack frame
		
		jr $ra




.end fibonacci


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
