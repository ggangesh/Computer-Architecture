.data
st1 : .asciiz "Enter the n: "
st2 : .asciiz " The value of F(n) is : "
n : .word 0

.text 
#-----------------------------------------------------------------

.globl main
.ent main



main :
	
	la $s0 , n  	#Address of n

	li $v0 , 4
	la $a0 , st1 			#print  the enter msg for n 
	syscall 
	
	li $v0 , 5 			
	syscall			
	sw $v0 , ($s0) 	

	lw $a0 , ($s0)


	addi $sp  , $sp , -8
	sw $ra , 0($sp)
	sw $a0 , 4($sp)
	jal recurse

	lw $ra , ($sp)
	lw $a0 , 4($sp)
	addi $sp , $sp  ,8


	add $s1, $0 ,$v0


	li $v0 , 4
	la $a0 , st2			#print  the enter msg for n 
	syscall 

	li $v0 , 1 	# print F(n)
	move $a0 , $s1
	syscall

	li $v0 , 10
	syscall

.end main



#-----------------------------------------------------
# FUNCTION recurse 

.ent recurse 

recurse :

addi $sp  , $sp , -8
sw $ra , 0($sp)
sw $a0 , 4($sp)

li $s6 , 100		# 100 is stored in register


slt $t0 , $s6 , $a0 
beq $t0 , 1 , funsub 

	addi $a0 ,$a0 , 11

	jal recurse

	lw $ra , ($sp)
	lw $a0 , 4($sp)
	addi $sp , $sp  ,8

	addi $a0 , $v0 ,11

	jr $ra

funsub :

	addi $v0 ,$a0 , -10
	lw $ra , ($sp)
	lw $a0 , 4($sp)
	addi $sp , $sp  , 8 
	jr $ra


.end recurse


