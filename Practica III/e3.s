.data
	lad1: .asciiz "\nL1 : "
	lad2: .asciiz "\nL2 : "
	lad3: .asciiz "\nL3 : "
	invalido: .asciiz "\Invalido"
	valido: .asciiz "\nValido"
.text
main:
	li $v0, 4
	la $a0, lad1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0,4
	la $a0, lad2
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	li $v0,4
	la $a0, lad3
	syscall
	li $v0,5
	syscall
	move $t3,$v0
	add $t4, $t1, $t2
	add $t5, $t2, $t3
	add $t6, $t1, $t3
	bge $t3, $t4, TINV
	bge $t2, $t6, TINV
	bge $t1, $t5, TINV
	b TVAL
	TVAL:
		li $v0, 4
		la $a0, valido
		syscall
		b FIN
	TINV:
		li $v0, 4
		la $a0, invalido
		syscall
		b FIN
FIN:
jr $ra