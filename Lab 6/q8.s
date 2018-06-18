
		.data

		.text
		.global	main
main:
		;*** add two registers and store in third 
		add r1, r2,r3
		nop
		;*** This bnez needs output from add to find if r1 is equal to 0 thus this causes data forwarding from EX of add to ID of bnez
		bnez r1, finish
finish:
		;*** end
		trap		0