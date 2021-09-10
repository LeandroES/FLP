.data
	lista: .word 0:5  
	
	lin1:	.asciiz "Ingresa un numero: "
	lin2:   .asciiz "Los 5 primeros multiplos de "
	lin3:	.asciiz " son los siguientes: \n"
	lin4: 	.asciiz "\n"
	
.text
main:
	li		$t1,1		
	la 		$t2, lista	
	li		$t4,0		

	li		$v0, 4
	la		$a0, lin1
	syscall
	
	li		$v0, 5
	syscall	
	move	$t0, $v0

	li		$v0,4
	la		$a0,lin2
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li		$v0,4
	la		$a0,lin3 
	syscall

	loop1:
  		bge $t1, 6, exit
		mul $t4, $t0, $t1		

  		sw 	$t4, 0($t2)
		lw $t5, 0($t2)

		li $v0, 1 
		move $a0, $t5
		syscall

		li	$v0, 4
		la	$a0, lin4
		syscall

  		add $t2, $t2, 4
  		add $t1, $t1, 1
  	j loop1
	exit:

	jr $ra