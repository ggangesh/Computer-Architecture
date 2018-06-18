.data

newline: .asciiz	"\n"
.align 2
result: .space 4

.text 

.ent main

main:

	li $s0 , 10 #load 10 
	li $s1 , 75 #load 75
	addi $a0 , $s0 , 0 #pass a as argument
	addi $a1 , $s1 , 0 #pass b as argument

	jal gcd

	move $t0 , $v0 #store the gcd(10, 75) in c

	addi $a0 , $v0 , 0	#pass c as argument
	jal syscall_print_int
	jal syscall_print_newline

	li $v0 , 10
		syscall

	.end main

###function

.ent gcd

gcd:
	addi $t0 ,$a0 , 0	#store a in x
	addi $t1 ,$a1 , 0	#store b in y

	loop1:
		beq $t0 , $t1 , returnloop
		slt $t2 , $t1 , $t0 # t2 is 1 if x > y 
		bne $t2 , $0 , xgreatery #goto x>y if t2 =1
		sub $t1 , $t1 , $t0 #y = y -x
		j loop1

	xgreatery :
			sub $t0 , $t0 , $t1	#x= x-y
			j loop1

	returnloop:
		addi $v0 , $t0 ,0	#return value
		jr $ra


.end gcd


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

