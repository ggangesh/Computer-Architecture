.data
A:
	.align 2 #Align the next datum on a 2^2 byte boundary.
	.space 40 #Create array with 20 integers

.text
main:
	la $s0, A 				#Load address of array
	li $s1, 1 				#Put some integer in s1
	sw $s1, 1($s0) 			#Store in a non word aligned address

exit:
	li $v0, 10				#exit call
	syscall 