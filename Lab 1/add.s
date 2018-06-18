.text
main:
# Your code starts from the line below

li	$t0 , 1   # load immmediate value 1 to temporary regiter t0
li	$t1 , 2   # load immmediate value 2 to temporary regiter t1
add $t2 , $t0 , $t1   # $t2 = $t0 + t1 signed 2's complementary add
li $v0,10
syscall
