#Pratik Gupta
#Conditions in assembly language else if
# Email - pgcool33@gmail.com

.text
main:


#s0 = inputgrade
jal inputgrade
li $s1,0 #enteries
li $s2,0 #total
start_loop:
sne $t1,$s0,-1
beqz $t1,end_loop
add $s1,$s1,1
add $s2,$s2,$s0
jal inputgrade
b start_loop
end_loop:
 li $s3,0 #average
 div $s3,$s2,$s1
 li $v0,4
 la $a0,average
 syscall
 

 li $v0,1
 move $a0,$s3
 syscall
 
 slti $t1,$s3,0
 sgt $t2,$s3,100
 or $t1,$t1,$t2
 beq $t1,1,else
 sge $t1,$s3,90
 beqz $t1,gradeB
 li $v0,4
 la $a0,gradea
 syscall
 jal exit
 gradeB:
 sge $t1,$s3,80
 beqz $t1,gradeC
  li $v0,4
 la $a0,gradeb
 syscall
 jal exit
 gradeC:
 sgt $t1,$s3,70
 beqz $t1,gradeF
 li $v0,4
 la $a0,gradec
 syscall
 jal exit
 gradeF:
  li $v0,4
 la $a0,gradef
 syscall
 jal exit
 else:
  li $v0,4
 la $a0,invalid
 syscall
 
 exit:
 li $v0,10
 syscall
 
 inputgrade:
li $v0,4
la $a0,input
syscall

li $v0,5
syscall
move $s0,$v0
b start_loop

 
 .data
 input: .asciiz "Enter grade, or -1 when done "
 average:.asciiz "Average is "
 gradea: .asciiz"Grade is A"
 gradeb: .asciiz"Grade is B"
 gradec: .asciiz"Grade is C"
 gradef: .asciiz"Grade is F"
 invalid: .asciiz"Grade is invalid"
 
 
 
 
 
 
