    .file   1 "gcd.c"
    .text
    .align  2
    .globl  gcd
    .set    nomips16
    .ent    gcd

gcd:
    .frame      $fp, 8, $31     # vars= 0, regs= 1/0, args= 0, gp= 0
    .mask       0x40000000, -4
    .fmask      0x00000000, 0
    .set        noreorder
    .set        reorder

    addiu       $sp, $sp, -8    
    sw          $fp, 4($sp)     # store fp on stack
    move        $fp, $sp        # fp = sp
    sw          $4, 8($fp)      # store a0 (10) in stack
    sw          $5, 12($fp)     # store a1 (75) in stack

$L5:
    lw          $3, 8($fp)      # v1 = a0 from stack
    lw          $2, 12($fp)     # v0 = a1 from stack
    bne         $3, $2, $L2     # if v0 != v1 goto L2
    lw          $2, 8($fp)      # else v0 = a0
    move        $sp, $fp        
    lw          $fp, 4($sp)     # restore fp
    addiu       $sp, $sp, 8     # pop stack
    j           $31             # jump to return address

$L2:                            # if v1 != v0
    lw          $3, 8($fp)      # v1 = a0 from stack
    lw          $2, 12($fp)     # v0 = a1 from stack
    slt         $2, $2, $3      # if v0 < v1 , v0 = 1
    beq         $2, $0, $L3     # if v0 = 0, goto L3
    lw          $3, 8($fp)      # else v1 = a0 from stack
    lw          $2, 12($fp)     # v0 = a1 from stack
    subu        $2, $3, $2      # v0 = v1 - v0
    sw          $2, 8($fp)      # store v0 in stack
    b           $L5             # goto L5 (loop)

$L3:                            # if v0 < v1
    lw          $3, 12($fp)     # v1 = a1 from stack
    lw          $2, 8($fp)      # v0 = a0 from stack
    subu        $2, $3, $2      # v0 = v1 - v0
    sw          $2, 12($fp)     # store v0 in stack
    b           $L5             # goto L5 (loop)

    .end    gcd
    .align  2
    .globl  main
    .set    nomips16
    .ent    main

main:
    .frame  $fp, 48, $31        # vars= 16,  regs= 2/0,  args= 16,  gp= 8
    .mask   0xc0000000, -4
    .fmask  0x00000000, 0
    .set    noreorder
    .set    reorder

    addiu       $sp, $sp, -48   # reserve 48 bytes on stack
    sw          $31, 44($sp)    # push ra on stack
    sw          $fp, 40($sp)    # push fp on stack
    move        $fp, $sp        # fp = sp
    li          $2, 10          # v0 = 10
    sw          $2, 32($fp)     # store 10 on frame
    li          $2, 75          # v0 = 75 
    sw          $2, 28($fp)     # store 75 on frame

    lw          $4, 32($fp)     # store 10 in a0
    lw          $5, 28($fp)     # store 75 in a1
    jal         gcd             # call gcd

    sw          $2, 24($fp)     # store v0 (answer) in stack
    lw          $4, 24($fp)     # load  v0 (answer) in a0
    jal         syscall_print_int
    jal         syscall_print_newline
    move        $sp, $fp
    lw          $31, 44($sp)
    lw          $fp, 40($sp)
    addiu       $sp, $sp, 48
    j           $31
    .end        main

.data
newline: .asciiz    "\n"
.align 2
result: .space 4

.text

syscall_print_int:
    addi        $sp, $sp, -4
    sw          $ra, 0($sp)
    li          $v0, 1
    syscall
    lw          $ra, 0($sp)
    addi        $sp, $sp, 4
    jr          $ra
    nop

syscall_print_newline:
    addi        $sp, $sp, -4
    sw          $ra, 0($sp)
    li          $v0, 4
    la          $a0, newline
    syscall
    lw          $ra, 0($sp)
    addi        $sp, $sp, 4
    jr          $ra
    nop

