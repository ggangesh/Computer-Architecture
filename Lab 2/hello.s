.data

buffer :  .space 30
ask_name_str :  .asciiz  "Please enter your name :"
hello_str : .ascii  "Hello " 

.text
main:
li $v0 , 4  # syscall to print	 			
la $a0 , ask_name_str # Load and print string asking for string
syscall

li $v0 , 8  # read string
la $a0 , buffer  # memory address of string input buffer
li $a1 , 30 # length of string buffer
move $t0, $a0   # save string to t0
syscall


li $v0 , 4  # syscall to print	 			
la $a0 , hello_str # Load and print string asking for string
syscall

li $v0 , 4  # syscall to print
la $a0 , buffer  # reload byte space to primary address
move $t0, $a0   # save string to t0 
syscall

li $v0, 10      # end program
syscall




