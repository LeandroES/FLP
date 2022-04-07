.data	

pedir_num: .asciiz "Insertar el numero: "
saludo_no: .asciiz "No es primo"
saludo_si: .asciiz "Es primo"

.text
main:	
	la $a0 pedir_num
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	li $t1 2
	
loop:   beq $t0 $t1 es_primo
	div $t0 $t1
	mfhi $t2
	beqz $t2 no_primo
	addi $t1 $t1 1
	b loop
	
no_primo:
	li $v0 4
	la $a0 saludo_no
	syscall
	b exit
	
es_primo:
	li $v0 4
	la $a0 saludo_si
	syscall
	b exit
	
exit:	li $v0 10
	syscall