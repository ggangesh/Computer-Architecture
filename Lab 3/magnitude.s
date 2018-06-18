.data
st0 : .asciiz "Enter length :"
st1 : .asciiz "Enter the elments of array "
st2 : .asciiz " The start index : "
st3 : .asciiz " The end index : "
st4 : .asciiz "Maximum magnitude is: "
st5 : 
ns: .word 0
ne : .word 0
n :  .word 0

	.align 2
A :  .space 160

.text 
#-----------------------------------------------------------------


.globl main
.ent main



main :

la $s0 , A		# store address of array into s0 

li $v0 , 4
la $a0 , st0			#print  the enter msg for n 
syscall


li $v0 , 5 			
syscall			
sw $v0 , n


li $v0 , 4
la $a0 , st1 			#print  the enter msg for n 
syscall

#la $s1 , n 		# get address into s1

lw $s1 , n

addi $t0 , $0 ,0	#counter
addi $t1 , $0 ,0	#index

addi $t3 , $s0, 0	#address


loop2:
	li $v0 , 5	# load syscall to read interger
	syscall
	sw $v0 , ($t3)
	addi $t3 , $t3 ,4
	li $v0 , 5	# load syscall to read interger
	syscall
	sw $v0 , ($t3)
	addi $t3 , $t3 ,4
	addi $t0, $t0, 1
	bne $t0 , $s1 , loop2

li $v0 , 4
la $a0 , st2 			#print  the enter msg for ns 
syscall 
li $v0 , 5
syscall				#load ns
sw $v0 , ns

li $v0 , 4
la $a0 , st3 			#print  the enter msg for  ne
syscall 

li $v0 , 5
syscall				#load ne
sw $v0 , ne


add $a0 , $0 ,$s0
lw $a1 , ns			#ARGUMENTS
lw $a2 , ne



jal maximumMagnitude

add $s1 , $0 , $v0 
add $s2 , $0 , $v1
li $v0 , 4
la $a0 , st4 			#print   msg for maxmagnitude3
syscall 

li $v0 , 1 	# print F(n)
move $a0 , $s1
syscall

li $v0 , 4
la $a0 , st5 			#print   msg for maxmagnitude 
syscall 

li $v0 , 1 	# print F(n)
move $a0 , $s2
syscall

li $v0 , 10
syscall

.end main



##-------------------------------------------------------------

.ent maximumMagnitude

maximumMagnitude :

addi $s1 , $0 ,0	#counter
addi $s2 , $0 , 0	# max magnitude

lw $s6 , n

la $s3 , A	# a address
addi $s4 , $0 ,0	# max counm

add $t5 , $a1 , $0		#start

addi $t0 , $0 ,1
addi $t0 , $t0 ,1
add $t0 , $t0 ,$t0		#4

mul $t5, $a1, $t0
add $t5 , $t5 , $s3 	#start address

sub $s6 , $a2 , $a1
addi $s6, $s6 ,1	 #counter update



loop3:
	
	lw $a0 , ($s3)
	lw $a1 , 4($s3)

	jal magnitude

	add  $s5 , $v0 , $0 		# magnitide

	slt $t1 , $s2 , $s5 
	beq $t4 , 1 , nochangemax
	addi $s2 , $s5 , 0
	addi $s4 , $0 ,1
	j endif1

	nochangemax:
		beq $s2 , $s5 , noupdatecount
		addi $s4 , $s4 , 1
		j endif2

		noupdatecount:
		endif2:
	endif1:
	addi $t0 ,  $t3 , 8
	addi $s1 , $s1 , 1
	bne $s1 , $s6 , loop3

add $v0 , $s2 , $0
add $v1 , $s4 , $0

jr $ra

.end maximumMagnitude
#---------------------------------------------------------------
.ent magnitude
magnitude :

mul $t3 , $a0 , $a0
mul $t4 , $a1 , $a1
add $v0 , $t3 , $t4

jr $ra 

.end magnitude 