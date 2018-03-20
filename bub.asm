#Pratik Gupta
#bubble sort in assembly
# Email - pgcool33@gmail.com

.text
main:
li $t7,0 #c
li $v0,4
la $a0,Array
syscall
li $t0,0

input_loop:
 beq $t0,20,bubblesort
 
 li $v0,5
 syscall
 
 sw $v0, array($t0)
 addi $t0,$t0,4
 
 j input_loop
  
bubblesort:
 li $t1,0 #d
 addi $t2,$t1,4 #d+1
 beq $t7,20,printarray
 inner_loop:
  beq $t1,20,c_increase
  lw $t3 , array($t1)
  lw $t4 , array($t2)
  bgt $t3,$t4,swap
  addi $t1,$t1,4
  addi $t2, $t2,4
  j inner_loop
  
  c_increase:
    addi $t7,$t7,4
    j bubblesort
    
swap:
 #lw $t5,array($t1)
 #lw $t6 ,array($t2)
 sw $t3,array($t2)
 sw $t4, array($t1)
 addi $t1,$t1,4
  addi $t2, $t2,4
 j inner_loop
 
printarray:
 addi $t7,$zero,0
 li $v0,4
 la $a0,sortarray
 syscall
 
 print_loop:
  beq $t7,20,exit
  li $v0,1
  lw $a0,array($t7)
  syscall
  
  li $v0,4
  la $a0,space
  syscall
  
  addi $t7,$t7,4
  j print_loop

 exit:
 li $v0,10
 syscall
 
 
.data

array: .space 20
Array: .asciiz"Enter Array "
space: .asciiz" "
sortarray: .asciiz"Sorted array- "
  
