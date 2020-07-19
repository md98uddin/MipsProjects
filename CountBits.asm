li $a0, 2750 # arbritary value; expect 8 1's since 2750 is 101010111110
 jal COUNT # jump and link COUNT with $ra
 
 move $t1, $v0 # $v0 will be rewritten by system call
 
 li $v0, 1 # print value 
 move $a0, $t1
 syscall
 
 li $v0, 10 # terminate program
 syscall
 
 COUNT:
 beq $t0, 32, exit # exit if 0-31 bits are done
 and $t1, $a0, 1 # AND bitwise with 1 will tell us if LSB is a 0 or 1
 srl $a0, $a0, 1 # shift a0 right by 1 bit to get next LSB
 addi $t0, $t0, 1 # add 1 to loop count
 beqz $t1, COUNT # if $t1 is 0, that bit is not a 1, check next LSB
 addi $v0, $v0, 1 # if $t1 is 1, that bit is a 1, add 1 to counter
 j COUNT # go to start of loop again
 
 exit:
 jr $ra # return to pc+4
 
