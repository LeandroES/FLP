main:
	li	$v0,4
	la	$a0,str1
	syscall
	
	li	$v0,5
	syscall
	move	$s0,$v0
	
	li	$v0,4
	la	$a0,str1
	syscall
	li	$v0,5
	syscall
	move	$s1,$v0
	
	REPEAT:
		move $s2,$s1
		div $s0,$s1
	mfhi $s3
		move $s0,$s1
		move $s1,$s3
		
	UNTIL: bnez $s3,REPEAT
	li	$v0,4
		la	$a0,str2
		syscall
		li	$v0,1
		move $a0,$s2
		syscall
	
jr	$ra
.data
str1:	.asciiz "Ingresa el numero: "
str2:	.asciiz "El maximo comun divisor es: "
