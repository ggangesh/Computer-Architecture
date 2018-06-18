[0x00400000]	0x8fa40000  lw $4, 0($29)                   ; 183: lw $a0 0($sp)		# argc
[0x00400004]	0x27a50004  addiu $5, $29, 4                ; 184: addiu $a1 $sp 4		# argv
[0x00400008]	0x24a60004  addiu $6, $5, 4                 ; 185: addiu $a2 $a1 4		# envp
[0x0040000c]	0x00041080  sll $2, $4, 2                   ; 186: sll $v0 $a0 2
[0x00400010]	0x00c23021  addu $6, $6, $2                 ; 187: addu $a2 $a2 $v0
[0x00400014]	0x0c100024  jal 0x00400090 [main]           ; 188: jal main
[0x00400090]	0x27bdffd0  addiu $29, $29, -48             ; 62: addiu       $sp, $sp, -48   # reserve 48 bytes on stack
[0x00400094]	0xafbf002c  sw $31, 44($29)                 ; 63: sw          $31, 44($sp)    # push ra on stack
[0x00400098]	0xafbe0028  sw $30, 40($29)                 ; 64: sw          $fp, 40($sp)    # push fp on stack
[0x0040009c]	0x001df021  addu $30, $0, $29               ; 65: move        $fp, $sp        # fp = sp
[0x004000a0]	0x3402000a  ori $2, $0, 10                  ; 66: li          $2, 10          # v0 = 10
[0x004000a4]	0xafc20020  sw $2, 32($30)                  ; 67: sw          $2, 32($fp)     # store 10 on frame
[0x004000a8]	0x3402004b  ori $2, $0, 75                  ; 68: li          $2, 75          # v0 = 75 
[0x004000ac]	0xafc2001c  sw $2, 28($30)                  ; 69: sw          $2, 28($fp)     # store 75 on frame
[0x004000b0]	0x8fc40020  lw $4, 32($30)                  ; 71: lw          $4, 32($fp)     # store 10 in a0
[0x004000b4]	0x8fc5001c  lw $5, 28($30)                  ; 72: lw          $5, 28($fp)     # store 75 in a1
[0x004000b8]	0x0c100009  jal 0x00400024 [gcd]            ; 73: jal         gcd             # call gcd
[0x00400024]	0x27bdfff8  addiu $29, $29, -8              ; 15: addiu       $sp, $sp, -8    
[0x00400028]	0xafbe0004  sw $30, 4($29)                  ; 16: sw          $fp, 4($sp)     # store fp on stack
[0x0040002c]	0x001df021  addu $30, $0, $29               ; 17: move        $fp, $sp        # fp = sp
[0x00400030]	0xafc40008  sw $4, 8($30)                   ; 18: sw          $4, 8($fp)      # store a0 (10) in stack
[0x00400034]	0xafc5000c  sw $5, 12($30)                  ; 19: sw          $5, 12($fp)     # store a1 (75) in stack
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x0040007c]	0x8fc3000c  lw $3, 12($30)                  ; 43: lw          $3, 12($fp)     # v1 = a1 from stack
[0x00400080]	0x8fc20008  lw $2, 8($30)                   ; 44: lw          $2, 8($fp)      # v0 = a0 from stack
[0x00400084]	0x00621023  subu $2, $3, $2                 ; 45: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400088]	0xafc2000c  sw $2, 12($30)                  ; 46: sw          $2, 12($fp)     # store v0 in stack
[0x0040008c]	0x0401ffeb  bgez $0 -84 [$L5-0x0040008c]    ; 47: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400058]	0x8fc30008  lw $3, 8($30)                   ; 32: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040005c]	0x8fc2000c  lw $2, 12($30)                  ; 33: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400060]	0x0043102a  slt $2, $2, $3                  ; 34: slt         $2, $2, $3      # if v0 < v1 , v0 = 1
[0x00400064]	0x10400006  beq $2, $0, 24 [$L3-0x00400064] ; 35: beq         $2, $0, $L3     # if v0 = 0, goto L3
[0x00400068]	0x8fc30008  lw $3, 8($30)                   ; 36: lw          $3, 8($fp)      # else v1 = a0 from stack
[0x0040006c]	0x8fc2000c  lw $2, 12($30)                  ; 37: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400070]	0x00621023  subu $2, $3, $2                 ; 38: subu        $2, $3, $2      # v0 = v1 - v0
[0x00400074]	0xafc20008  sw $2, 8($30)                   ; 39: sw          $2, 8($fp)      # store v0 in stack
[0x00400078]	0x0401fff0  bgez $0 -64 [$L5-0x00400078]    ; 40: b           $L5             # goto L5 (loop)
[0x00400038]	0x8fc30008  lw $3, 8($30)                   ; 22: lw          $3, 8($fp)      # v1 = a0 from stack
[0x0040003c]	0x8fc2000c  lw $2, 12($30)                  ; 23: lw          $2, 12($fp)     # v0 = a1 from stack
[0x00400040]	0x14620006  bne $3, $2, 24 [$L2-0x00400040] ; 24: bne         $3, $2, $L2     # if v0 != v1 goto L2
[0x00400044]	0x8fc20008  lw $2, 8($30)                   ; 25: lw          $2, 8($fp)      # else v0 = a0
[0x00400048]	0x001ee821  addu $29, $0, $30               ; 26: move        $sp, $fp        
[0x0040004c]	0x8fbe0004  lw $30, 4($29)                  ; 27: lw          $fp, 4($sp)     # restore fp
[0x00400050]	0x27bd0008  addiu $29, $29, 8               ; 28: addiu       $sp, $sp, 8     # pop stack
[0x00400054]	0x03e00008  jr $31                          ; 29: j           $31             # jump to return address
[0x004000bc]	0xafc20018  sw $2, 24($30)                  ; 75: sw          $2, 24($fp)     # store v0 (answer) in stack
[0x004000c0]	0x8fc40018  lw $4, 24($30)                  ; 76: lw          $4, 24($fp)     # load  v0 (answer) in a0
[0x004000c4]	0x0c100038  jal 0x004000e0 [syscall_print_int]; 77: jal         syscall_print_int
[0x004000e0]	0x23bdfffc  addi $29, $29, -4               ; 94: addi        $sp, $sp, -4
[0x004000e4]	0xafbf0000  sw $31, 0($29)                  ; 95: sw          $ra, 0($sp)
[0x004000e8]	0x34020001  ori $2, $0, 1                   ; 96: li          $v0, 1
[0x004000ec]	0x0000000c  syscall                         ; 97: syscall
5[0x004000f0]	0x8fbf0000  lw $31, 0($29)                  ; 98: lw          $ra, 0($sp)
[0x004000f4]	0x23bd0004  addi $29, $29, 4                ; 99: addi        $sp, $sp, 4
[0x004000f8]	0x03e00008  jr $31                          ; 100: jr          $ra
[0x004000c8]	0x0c100040  jal 0x00400100 [syscall_print_newline]; 78: jal         syscall_print_newline
[0x00400100]	0x23bdfffc  addi $29, $29, -4               ; 104: addi        $sp, $sp, -4
[0x00400104]	0xafbf0000  sw $31, 0($29)                  ; 105: sw          $ra, 0($sp)
[0x00400108]	0x34020004  ori $2, $0, 4                   ; 106: li          $v0, 4
[0x0040010c]	0x3c041001  lui $4, 4097 [newline]          ; 107: la          $a0, newline
[0x00400110]	0x0000000c  syscall                         ; 108: syscall

[0x00400114]	0x8fbf0000  lw $31, 0($29)                  ; 109: lw          $ra, 0($sp)
[0x00400118]	0x23bd0004  addi $29, $29, 4                ; 110: addi        $sp, $sp, 4
[0x0040011c]	0x03e00008  jr $31                          ; 111: jr          $ra
[0x004000cc]	0x001ee821  addu $29, $0, $30               ; 79: move        $sp, $fp
[0x004000d0]	0x8fbf002c  lw $31, 44($29)                 ; 80: lw          $31, 44($sp)
[0x004000d4]	0x8fbe0028  lw $30, 40($29)                 ; 81: lw          $fp, 40($sp)
[0x004000d8]	0x27bd0030  addiu $29, $29, 48              ; 82: addiu       $sp, $sp, 48
[0x004000dc]	0x03e00008  jr $31                          ; 83: j           $31
[0x00400018]	0x00000000  nop                             ; 189: nop
[0x0040001c]	0x3402000a  ori $2, $0, 10                  ; 191: li $v0 10
[0x00400020]	0x0000000c  syscall                         ; 192: syscall			# syscall 10 (exit)