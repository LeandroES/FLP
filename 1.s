main:
	li	$v0,4
	la	$a0,str1
	syscall
	li	$v0,5
	syscall
	move	$t0,$v0
	lw $t1,dato1($0)
	lw $t2,dato2($0)
	div	$t0,$t1
	mfhi $a0
	beq $a0,$t2, IF
	ELSE:
		la $a0,str3
		b END_IF
	IF:
		la $a0,str2
	END_IF:
		li $v0,4
		syscall
	jr	$ra
.data
str1:	.asciiz "\nIngresa el numero: "
str2:	.asciiz "Es par\n"
str3:	.asciiz "No es par\n"
dato1:  .word 2
dato2:	.word 0