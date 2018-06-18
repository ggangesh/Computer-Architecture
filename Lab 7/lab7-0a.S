
		.data
		.text
		.global	main
main:
		;*** Read two positive integer numbers into R1 and R2
		addi		r1,r0,10
		;*** This bnez needs output from addi to find if r1 is equal to 0 
		;*** thus this causes an r-stall and requires data forwarding from intEx stage to ID stage
		addi r2, r3, 0
		addi r4, r5, 10
		bnez r1, finish
		addi r5, r6, 10
finish:
		;*** end
		trap		0