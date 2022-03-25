.data
	x1: .asciiz "\nType a #1 : "
	x2: .asciiz "\nType #2 : "
	s_text: .asciiz "\n+ : "
	d_text: .asciiz "\n/ : "
	x_text: .asciiz "\nx : "
	r_text: .asciiz "\n- : "
	a_text: .asciiz "\nAVG : "
.text
main:
	li $v0, 4
	la $a0, x1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, x2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	la $a0, s_text
	li $v0, 4
	syscall
	add $t0, $t1, $t2
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, r_text
	li $v0, 4
	syscall
	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	la $a0, x_text
	li $v0, 4
	syscall
	mul $a0, $t1, $t2
	li $v0, 1
	syscall
	la $a0, d_text
	li $v0, 4
	syscall
	mtc1 $t1, $f1
  	cvt.s.w $f1, $f1
  	mtc1 $t2, $f2
 	cvt.s.w $f2, $f2
	div.s $f12, $f1, $f2
	li $v0, 2
	syscall
	la $a0, a_text
	li $v0, 4
	syscall
	mtc1 $t0, $f3
	cvt.s.w $f3, $f3
	li.s $f4, 2.0
	div.s $f12, $f3, $f4
	li $v0, 2
	syscall
	jr $ra