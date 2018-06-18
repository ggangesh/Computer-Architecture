.data

	start_prompt:	.asciiz	"Enter the number: "
	
	end_prompt	:	.asciiz	"Factorial is : "
	
	number		:	.word	0	
	factorial_return	:	.word 	0
#  Main routine.
# 
.text

.globl main
.ent main

	main:
		li 	$v0 , 4 			# is string
		la 	$a0 , start_prompt 			# Load and print for asking the number
		syscall
		
		li $v0 , 5	# syscall to read interger
		syscall
		sw $v0 , number		# store number in number '
		
		lw $a0 , number 		# pass as argument to ISEVEN
		
		jal  FACTORIAL    	# call function
		
		sw $v0 , factorial_return 	# store main return
		la $s1 , factorial_return		# get the address
			
		lw $t0 , ($s1) 		# store it in t0 
		
		
		li 	$v0 , 4 			# print string
		la 	$a0 , end_prompt 			# Load and print for ending statement
		syscall
		
		
		li $v0 , 1 	# print int
		move $a0 , $t0	#move factorial return 
		syscall
		
		
		
		
		li $v0 , 10
	syscall

.end main

#-------------------------------------------------
# Function to find factorial
# ­­­­­
#  Arguments
#	 $a0 – x
#	 
#  Returns
# 	$v0 ­- factorial
.globl FACTORIAL
.ent FACTORIAL
		
	FACTORIAL:
		addi $t0 ,	$0, 0 	# make counter
		#addi 
		addi $v0 ,	$0, 1	# copy to factorial
		
		loop1:
			addi	$t0 , 1	#update index
			mult 	 $v0 , $t0	# multiply to index 
			mflo 	$v0			# move to v0
			bne		$t0 , $a0 , loop1
		
		#add $v0 , $t1 ,$0 	# copy to return register
	jr $ra
.end FACTORIAL 
			

		
		
		
