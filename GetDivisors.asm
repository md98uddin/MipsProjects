li $a0, 24 # positive number stored in a0
li $t0, 0 # initialize counter to 0 
move $t1, $a0 # move to t1 value from a0 

beq $a0, $t0, exit #if a0 is 0, jump to exit, print and terminate 
add $t2, $t1, 1 # value + 1 for conditional check

jal DIVISORS # hold a reference to pc+4

li $v0, 10 #terminate
syscall

DIVISORS:
addi $t0, $t0, 1 # increase by 1
beq $t0, $t2, jumpback # if t0 equals t2(value+1), exit
div $t1, $t0 # set hi and low 
mfhi $s0 # set remainder to s0
slti $s0, $s0,1 # check if s0 is less than 0 (no remainder)
beq $s0, 0, DIVISORS # if s0 is a 0, run loop again
li $v0, 1 # print the divisor if s0 is a 1
move $a0, $t0
syscall
li $v0, 11 # print newline after each divisor
li $a0, 10
syscall
j DIVISORS # jump to loop

# once we check the value itself as divisor, we jump to pc+4
jumpback:
jr $ra #jump to pc+4

#only executes if a0 has a 0, edge case
exit:
li $v0, 1 # print 0
move $a0, $a0
syscall

li $v0, 10 # terminate
syscall
