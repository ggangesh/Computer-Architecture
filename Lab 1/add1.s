.text
main:
# Your code starts from the line below
lui $t0 , 4096 		#	10000001   load left
ori $t0 , $t0 , 1 	#load right

lui $t1 , 8192 		#  	20000002   load left
ori $t1 , $t1 , 2 	#	load right

addu $t3 , $t0 , $t1	#add 
li $v0,10
syscall
