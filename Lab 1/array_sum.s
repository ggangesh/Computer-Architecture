.data
N: .word 5
X: .word 2,4,6,8,10
SUM: .word 0
.text
main:
la $s0 , X  		# load adds of X0
la $s1 , SUM 		#
lw $t0 ,  ($s0)		#  X index

la $s3 , N	      #  	N
lw $t1 , ($s3)    # 	N
addi $t2 , $0 , 0 #   counter


lw $s2 , ($s1) 		#Sum
add $s2 , $t0 ,$s2 	


loop:
	
	addi $s0 , $s0 , 4
	lw $t0 ,  ($s0)
	addi $t2 , $t2 , 1
	add $s2 , $t0 ,$s2
	bne $t2 , $t1 , loop 

sw $s2 , ($s1) 		

add $v0 , $0 , $s2  

li $v0,10
syscall



