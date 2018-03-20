#Pratik Gupta
#Nested loop program in assembly
# Email - pgcool33@gmail.com
.text
main:

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $s0,$v0

#s0 = n

start_outer_loop:
 sne $t1,$s0,-1
 beqz $t1,end_outer_loop
 slti $t1,$s0,-1
 beqz $t1,else
 li $v0,4
 la $a0,error
 syscall
    b end_if
 else:
  li $s1,0 #i
  li $s2,0 #total
  start_inner_loop:
   slt $t1,$s1,$s0
   beqz $t1,end_inner_loop
   add $s2,$s2,$s1
   addi $s1,$s1,1
   b start_inner_loop
  end_inner_loop:
   li $v0,4
   la $a0,output
   syscall
  
   li $v0,1
   move $a0,$s2
   syscall
end_if:
 li $v0,5
syscall
move $s0,$v0
 b start_outer_loop 
end_outer_loop:
 li $v0,10
 syscall

.data
prompt: .asciiz "Enter a value for the summation n, -1 to stop "
error: .asciiz "Negative input is invalid"
output: .asciiz "The summation is "
