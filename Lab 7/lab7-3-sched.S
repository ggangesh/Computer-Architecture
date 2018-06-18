
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
			lw r5, a(r4)
			lw r6, b(r4)
			;*** Loaded r10 three instructions before it is needed
			lw r10, alpha
			;*** Pushed mult instruction down by a step to give time for lw to finish
			mult r1, r5, r6
			;*** Loaded r5 three instructions before it is needed which also gives enough time for mult to execute
			lw r5, d(r4)
			sw c(r4), r1
			mult r1, r1, r10
			;*** Delayed add instruction to give enough time for mult to execute
			addi r2, r2, -1
			add r6, r5, r1
			;*** Moved sw instruction two instructions down so that execution of add instruction finishes
			sw d(r4), r6
			addi r4, r4, 4
			bnez r2, loop




loopexit:
		;*** end
		trap		0