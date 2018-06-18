
		.data

		.text
		.global	main
main:
		;*** mult is an expenxive operation and takes more cycles to finish than the subsequent add instruction
		;** A WAW stall is supposed to occur at this stage and use the output from add to check for bnez
		mult r1, r2,r3
		add r1, r3, r4
		bnez r1, finish
		
finish:
		;*** end
		trap		0