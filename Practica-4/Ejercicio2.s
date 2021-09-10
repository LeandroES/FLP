.data
    array1: .word 0:5
    number: .asciiz "Ingrese un número: "
    listInvers: .asciiz "Los elementos en orden inverso son: \n"
.text
main:
    la $t0, array1
    li $t1,0

numeros:
    bge $t1, 5, exit

    li $v0, 4
	la $a0, number
    syscall 

    li $v0, 5
    syscall

    sw $v0, 0($t0)

    add $t1, $t1, 1
    add $t0, $t0, 4
    j numeros
exit:
    
    li $v0, 4
	la $a0, listInvers
    syscall 

    li $t1, 0

lista:
    bge $t1, 5, END_LISTA
    sub $t0, $t0, 4
    lw $t2, 0($t0)

    li $v0, 1
    move $a0, $t2
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    add $t1, $t1, 1
    j lista
END_LISTA:

    jr $ra