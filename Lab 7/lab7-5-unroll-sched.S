
		.data
ReadPar:	.word		0
a: .word 1, 2, 3, 4, 5, 6
b: .word 2, 3, 4, 5, 6, 7
c: .word 0, 0, 0, 0, 0, 0
d: .word 0, 0, 0, 0, 0, 0
n: .word 6
alpha: .word 10

		.data
		.text
		.global	main
main:
		;*** r2 == n, r3 == i, r4 == 4*i
		lw r2, n
		loop:
			lw r5, a(r4)		;*** load a[i]
			lw r6, b(r4)		;*** load b[i]
			addi r14, r4, 4 		;*** keep track of number of loops
			lw r15, a(r14)		;*** load a[i]
			lw r16, b(r14)		;*** load b[i]
			mult r1, r5, r6		;*** a[i]*b[i]
			
			lw r10, alpha		;*** Load value of alpha
			lw r20, alpha		;*** Load value of alpha
			mult r11, r15, r16		;*** a[i]*b[i]
			
			sw c(r4), r1		;*** Store in c[i]
			sw c(r14), r11		;*** Store in c[i]
			

			mult r1, r1, r10 	;*** alpha*x
			lw r5, d(r4) 		;*** Retrieve d[i]
			
			mult r11, r11, r20 	;*** alpha*x
			lw r15, d(r14) 		;*** Retrieve d[i]
			
			addi r2, r2, -2 	;*** keep track of number of loops

			add r6, r5, r1 		;*** d[i]+f(c[i])		
			add r16, r15, r11 		;*** d[i]+f(c[i])		

			sw d(r4), r6 		;*** store back in d[i]
			
			sw d(r14), r16 		;*** store back in d[i]
			addi r4, r14, 4 		;*** keep track of number of loops


			bnez r2, loop		;*** If i<n then exit




loopexit:
		;*** end
		trap		0