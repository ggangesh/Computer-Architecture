1)
	a)
		1)mfc0/mtc0
		Registers in coprocessor 0 cannot be used directly by MIPS instructions. Instead, there are two instructions that work much like load and store instructions. The mfc0 (move from coprocessor 0) instruction loads data from a coprocessor 0 register into a CPU register. The mtc0 likewise stores data in a cp0 register.

		2).set noat/ .set at
		The .set at/noat is used in MIPS architecture and works by disabling/enabling warning when $at register is used by user.
		The $at (Assembler Temporary) register is generally reserved for use in pseudoinstructions.
		To protect your other registers it's important that the assembler doesn't use any other registers for pseudoinstructions, so if it's well behaved (and they all should be, or things would break) then it will always use $at.

		3)Cause Register
		The cause register, cp0 register 13, contains bits that identify the cause of the exception.

		4)EPC register
		The EPC register, cp0 register 14, is the exception program counter. It contains the address of the instruction that was running when the exception occurred. It serves the same purpose for the exception handler that CPU register $ra serves for ordinary subprograms. When the exception handler completes, the EPC register allows the program that was interrupted to be resumed.
	b)
		From command line:
			COMMAND: spim -exception_file exceptions.s 
			loads spim with exception handler set to the file "exceptions.s" in the directory from which the command is being called
		Using qtspim:
			Write the exception handler in a separate file, store that file in any directory, then open the "Exception Handler..." dialog in the Settings menu(Found in simulator menu of qtspim), check the check box and browse to that file.
	

