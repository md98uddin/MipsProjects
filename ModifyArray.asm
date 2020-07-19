.data
    a: 
        .word 3, 2, 1, 8, 6, 9, 3, 4, 2, 5
    nline: 
        .asciiz "\n"

    .text
    .globl main
main:
    li      $v0, 0
    la      $t1, a
loop1:
    bge     $t0, 10, exit

    # load word from addrs and goes to the next addrs
    lw      $t2, 0($t1)
    
     # syscall to print value
    addi $t2, $t2, 5
    sw $t2, 0($t1)
    lw $t3, 0($t1)
    
    li      $v0, 1      
    move    $a0, $t3
    syscall
    
    # optional - syscall number for printing character (space)
    li      $a0, 32
    li      $v0, 11  
    syscall

    addi    $t1, $t1, 4

    #increment counter
    addi    $t0, $t0, 1
    j      loop1

 exit:
    li      $v0, 10
    syscall
