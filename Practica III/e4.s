.data
    xum: .asciiz "\nIngrese un numero: "
    num: .asciiz "\nEl numero  "
    esM: .asciiz " si es multiplo de "
    noesM: .asciiz " no es multiplo de "
.text
    main:
    li $t1, 1                    
    li $t2, 21
    li $v0, 4
	la $a0, xum
	syscall
    li $v0,5 
    syscall 
    move $a1, $v0
    LLAFE:
		beq $t2, $t1, Exit
		div	 $t1, $a1
		mfhi $t3
		beq $t3, 0, Multiplo
		NoMultiplo:
			li $v0, 4
			la $a0, num
			syscall
			move $a0 $t1
			li $v0, 1 
			syscall 
			move $t1 $a0
			li $v0, 4
			la $a0, noesM
			syscall
			move $a0 $a1
			li $v0, 1 
			syscall
			move $a1 $a0
			add $t1, $t1, 1 
		j LLAFE
		Multiplo: 
			li $v0, 4
			la $a0, num
			syscall
			move $a0 $t1			
			li $v0, 1 
			syscall 
			move $t1 $a0			
			li $v0, 4
			la $a0, esM
			syscall
			move $a0 $a1			
			li $v0, 1 
			syscall
			move $a1 $a0			
			add $t1, $t1, 1 
		j LLAFE
    Exit:
    jr $ra