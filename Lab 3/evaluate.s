.data
mypair1 : .word 0 , 0 #default intialiaztion

coeff1 : .word 0 , 0 , 0 # default intialization

st1 : .asciiz "Enter the pair x, y: "
st2 : .asciiz "Enter the coefficients a , b ,c : "
st3 : .asciiz "The value of polynomial at given point is : "

.text 
#-----------------------------------------------------------------
.globl main
.ent main

main :
	la $s0 , mypair1  	#Address of mypair1
	la $s1 , coeff1 	#Address of coeff1

	li $v0 , 4
	la $a0 , st1 			#print  the enter msg for mypair1 
	syscall 

	li $v0 , 5 			
	syscall			
	sw $v0 , ($s0) 			# save mypair1.x

	li $v0 , 5 			
	syscall			
	sw $v0 , 4($s0) 		# save mypair1.y

	li $v0 , 4
	la $a0 , st2 			#print  the enter msg for coeff1 
	syscall 

	li $v0 , 5 			
	syscall			
	sw $v0 , ($s1) 		# save coeff1.a

	li $v0 , 5 			
	syscall			
	sw $v0 , 4($s1) 		# save coeff1.b

	li $v0 , 5 			
	syscall			
	sw $v0 , 8($s1) 		# save coeff1.c

	li $v0 , 4
	la $a0 , st3 			#print  evaluate msg
	syscall 

	lw $a0 , ($s0)
	lw $a1 , 4($s0)
	lw $a2 , ($s1)
	lw $a3 , 4($s1)
	lw $t0 , 8($s1)			#

	addi $sp , $sp , -4		#decrement the sp pointer

	sw $t0 , ($sp)

	jal evaluate 			#

	add $s2 , $v0 , $0		#
	lw $s0 , -4($sp)
	lw $s1  , ($sp)			# retsore 
	addi $sp ,$sp , -4

	add $s3 , $0 , $v0

	li $v0 , 1 	# print int
	move $a0 , $s3
	syscall

	li $v0 , 10
	syscall

.end main



#-----------------------------------------------------
# FUNCTION evaluate 

.ent evaluate 

evaluate :

lw $t0 , ($sp)	#c0eff1.c
sw $s0 ,($sp)
addi $sp , $sp  , -4
sw $s1 , ($sp)

add  $t1 , $0 , $a0			# mypair1.x
add  $t2 , $0 , $a1  		# mypair1.y

add  $t3 , $0 , $a2			# coeff1.a
add  $t4 , $0 , $a3			#coeff1.b

addi $v0 , $0 ,0
mul $t5 , $t1 , $t1			# x^2
mul $t5 , $t5 , $t3			#a.x.x
mul $s0 , $t2 , $t2			#y.y
mul $s0 , $s0 , $t0			#c.y.y
mul $s2 , $t1 ,$t2			#x.y
mul $s2 , $t4 , $s2			#b.x.y

add $v0 , $0 , $t5
add $v0 , $v0 , $s0
add $v0 , $v0 , $s2
jr $ra


.end evaluate