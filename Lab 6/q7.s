
		.data
ReadPar:	.word		0

		.text
		.global	main
main:
		;*** load word 
		lw r1, ReadPar
		;*** This bnez needs output from lw to find if r1 is equal to 0 thus this causes an r-stall 
		;*** Also note taht this doesnt require data forwarding because WB and ID can occur in same clock cycle
		bnez r1, finish
finish:
		;*** end
		trap		0