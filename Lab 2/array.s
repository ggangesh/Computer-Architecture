.data
	.align 2
array 	: 	.space	32  	
n	:	.word 	8 
start_prompt	:	.asciiz "Enter the 8 numbers :\n"
even 			: 	.asciiz "Sum of values at even locations is larger\n"
odd				: 	.asciiz "Sum of values at odd locations is larger\n"
	
.text

main:



la $s0 , array 		# store address of array into s0 

addi $t0 , $0 , 0 	# counter register 
la $s1 , n 		# get address into s1
lw $t1 , ($s1) 	# load n from address s1

li 	$v0 , 4	
la 	$a0 , start_prompt 	# Load and print string asking for numbers
syscall	


loop1 :

	li $v0 , 5	# load syscall to read interger
	syscall
	sw $v0 , ($s0)
	addi $t0 , $t0 , 1	# inrement counter
	addi $s0 , $s0 , 4	# increment the index
	bne $t0 , $t1 , loop1

addi $t0 , $0 , 0 	# reintialize counter
addi $t2 , $0 , 0	# for the sum_odd
addi $t3 , $0 , 0	# for the sum_even
la $s0 , array 		# restore address of array into s0 

loop2 :	
	lw $t4 , ($s0)	# load interger from array
	add $t2 , $t2 ,$t4  	#incremebnt sum_odd
	addi $s0 , $s0 , 4	# increment the index
	lw $t4 , ($s0)	# load interger from array
	add $t3 , $t3 ,$t4  	#incremebnt sum_even
	addi $s0 , $s0 , 4	# increment the index
	addi $t0 , $t0 , 2	# inrement counter
	bne $t0 , $t1 , loop2


# if  else 
	slt 	$t4 , $t2 , $t3 	#test sum_ood < sum_even
	beq  	$t4 , $0 , print_odd 	# if false goto print_odd

	li 	$v0 , 4 			# sum_even is big
	la 	$a0 , even 			# Load and print string asking for string 
	syscall

	li 	$v0 , 1			#print
	move 	$a0, $t3		# move  sum_even
	syscall	

	j Endif				# end if else
	
print_odd :
	li 	$v0 , 4	
	la 	$a0 , odd # Load and print string asking for string 
	syscall	
	
	li 	$v0 , 1 		#print 
	move	$a0 , $t2	# move  sum_odd
	syscall	

Endif : 

li $v0, 10      # end program
syscall
 
	
	








