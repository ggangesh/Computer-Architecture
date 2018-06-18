.data

	start_prompt:	.asciiz	"Enter the number: "
	even_str	: 	.asciiz " is even\n"
	odd_str		: 	.asciiz " is not even\n"
	number		:	.word	0	
	main_return	:	.word 	0
#  Main routine.
# 
.text

.globl main
.ent main

	main:
		li 	$v0 , 4 			# is odd
		la 	$a0 , start_prompt 			# Load and print for asking the number
		syscall
	
		li $v0 , 5	# syscall to read interger
		syscall
		sw $v0 , number		# store number in number 
		
		la $s1 , number		# get the address	
		lw $a0 , ($s1) 		# pass as argument to ISEVEN 
		
		jal ISEVEN    	# call function
		
		sw $v0 , main_return 	# store main return
		la $s1 , main_return		# get the address	
		lw $t0 , ($s1) 		# store it in t0 to ISEVEN 
		
		
	beq  	$t0 , $0 , print_even 	# if false goto print_even
	
	li 	$v0 , 1			#print
	#move 	$a0, $t3		# move  sum_even
	syscall
	
	li 	$v0 , 4 			# is odd
	la 	$a0 , odd_str 			# Load and print for odd 
	syscall
	
	j Endif1				# end if else
	
print_even :

	li 	$v0 , 1 		#print 
	syscall


	li 	$v0 , 4	
	la 	$a0 , even_str 	# Load and print for even
	syscall	
	
Endif1 :

	li $v0 , 10
	syscall

.end main


#-------------------------------------------------
# Function to find even or odd
# ­­­­­
#  Arguments
#	 $a0 – x
#	 
#  Returns
# 	$v0 ­- 0 or 1 for even or odd
.globl ISEVEN
.ent ISEVEN
		
	ISEVEN:

	li $t1 , 2
	div $a0 , $t1   	# divide no by 2
	
	mfhi  $t2
	beq  $t2 , $0 , odd 	# if false goto odd

	li $v0 , 1	# as integer is even 	
	
	j Endif2				# end if else

odd: 
	li $v0 , 0

Endif2 :

	jr $ra
.end ISEVEN 
		
