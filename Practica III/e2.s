.data
	amnt: .asciiz "\nType numbers amount : "
	xum: .asciiz "\nType a number: "
	adi: .asciiz "\n+ : "
	avg: .asciiz "\na : "
	max: .asciiz "\n> : "
	min: .asciiz "\n<: "
.text
main:
	li $v0, 4
	la $a0, amnt
	syscall
	li $t1, 0
	li $v0, 5 
	syscall
	move $t2, $v0
	li $a1, 0
	li $t3, 0
	li $t9, 10000
    Loop:
		beq $t2, $t1, Exit
		li $v0, 4
		la $a0, xum
		syscall
		li $v0,5 
		syscall 
		move $t5, $v0
		beqz $a1, LABEL_IF
		LABEL_IF_ELSE:
			add $t1, $t1, 0
			b LABEL_IF
		LABEL_IF:
			move $t4, $v0
		end_LABEL_IF:
			add $t1, $t1, 0
		bge $t5, $t3, MAYOR_IF
		MAYOR_IF_ELSE:
			add $t1, $t1, 0
			b END_MAYOR_IF
		MAYOR_IF:
			move $t3, $t5
		END_MAYOR_IF:
			add $t1, $t1, 0
		ble $t5, $t9, MENOR_IF
		MENOR_IF_ELSE:
			add $t1, $t1, 0
			b END_MENOR_IF
		MENOR_IF:
			move $t9, $t5
		END_MENOR_IF:
			add $t1, $t1, 0
		move $a2, $v0
		add $a1, $a1, $a2
		add $t1, $t1, 1
	j Loop
    Exit:
la $a0, adi
li $v0, 4
syscall
move $a0, $a1
li $v0, 1 
syscall 
li $v0, 4
la $a0, avg
syscall
mtc1 $a1, $f1
cvt.s.w $f1, $f1
mtc1 $t2,$f2
cvt.s.w $f2, $f2
div.s $f12, $f1, $f2
li $v0, 2
syscall 
la $a0, max
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall
la $a0, min
li $v0, 4
syscall
move $a0, $t9
li $v0, 1
syscall
jr $ra