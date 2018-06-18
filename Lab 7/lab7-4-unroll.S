
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
			mult r1, r5, r6		;*** a[i]*b[i]
			sw c(r4), r1		;*** Store in c[i]
			lw r10, alpha		;*** Load value of alpha
			mult r1, r1, r10 	;*** alpha*x
			lw r5, d(r4) 		;*** Retrieve d[i]
			add r6, r5, r1 		;*** d[i]+f(c[i])		
			sw d(r4), r6 		;*** store back in d[i]
			addi r4, r4, 4 		;*** keep track of number of loops

			;*** beqz r2, loopexit		;*** If i<n then exit

			lw r5, a(r4)		;*** load a[i]
			lw r6, b(r4)		;*** load b[i]
			mult r1, r5, r6		;*** a[i]*b[i]
			sw c(r4), r1		;*** Store in c[i]
			lw r10, alpha		;*** Load value of alpha
			mult r1, r1, r10 	;*** alpha*x
			lw r5, d(r4) 		;*** Retrieve d[i]
			add r6, r5, r1 		;*** d[i]+f(c[i])		
			sw d(r4), r6 		;*** store back in d[i]
			addi r2, r2, -2 	;*** keep track of number of loops
			addi r4, r4, 4 		;*** keep track of number of loops


			bnez r2, loop		;*** If i<n then exit




loopexit:
		;*** end
		trap		0