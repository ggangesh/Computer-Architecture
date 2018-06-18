
		.data
ReadPar:	.word		0

		.data
		.text
		.global	main
main:
		;*** Read two positive integer numbers into R1 and R2
		
		addi		r1,r2,10
		bnez r1, finish
		;*** This bnez needs output from addi to find if r1 is equal to 0 
		;*** thus this causes an r-stall and requires data forwarding from intEx stage to ID stage
		addi r3, r4, 0
finish:
		;*** end
		trap		0