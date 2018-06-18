.data
	.align 2
ratio1: .word 0,0 #default initialisation
ratio2: .word 0,0 #default initialisation

slash : .asciiz "/"
	.text

.globl main
.ent main

	main:
		la $s0, ratio1 # Address of ratio1 is obtained in $s0 for future use
		la $s1, ratio2 # Address of ratio2 is obtained in $s1 for future use

	
		li $v0 , 5	# syscall to read interger
		syscall
		move $t0 , $v0	#move numer
		
		li $v0 , 5	# syscall to read interger
		syscall
		move $t1 , $v0	#move numer
		
		li $v0 , 5	# syscall to read interger
		syscall
		move $t2 , $v0	#move numer
		
		li $v0 , 5	# syscall to read interger
		syscall
		move $t3 , $v0	#move numer
		
		add $a0 , $s0  , $0
		add $a1 , $s1 ,  $0
		
		sw $t0 ,0($s0)
		sw $t1 ,4($s0)
		sw $t2 ,0($s1)
		sw $t3 ,4($s1)
		
		
				
		jal ADD
		
		lw $t0 , ($s0)
		li $v0 , 1 	# print int
		move $a0 , $t0	#move numer
		syscall
		
		li 	$v0 , 4 			# print string
		la 	$a0 , slash			# Load and print for slash
		syscall
		
		lw $t0 , 4($s0)
		li $v0 , 1 	# print int
		move $a0 , $t0	#move numer
		syscall
		
		
		
		
		
		
		
		li $v0 , 10
		syscall
		
.end main

#---------------------------------------------
#--funcuion add
#argumets
# returns

.ent ADD

	ADD:
		
		lw $t0 , ($a0)
		lw $t1 , 4($a1)
		mult 	 $t0 , $t1	# multiply to index 
		mflo 	$s2
		
		lw $t0 , 4($a0)
		lw $t1 , ($a1)
		mult 	 $t0 , $t1	# multiply to index 
		mflo 	$s3
		
		add	 $s2, $s2, $s3
		sw $s2, ($a0)
		
		lw $t0 , 4($a0)
		lw $t1 , 4($a1)
		mult 	 $t0 , $t1	# multiply to index 
		mflo 	$t0
		sw $t0 , 4($a0)
		
		jr $ra
.end ADD 
			
			
		
		
		 
		
	
		
		
