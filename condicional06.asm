# Desenvolva um programa que leia dois nú́ meros a e b e deixe-os em ordem
# crescente, ou seja, o menor deverá ficar armazenado na variável a e o maior
# na variável b.
.data
	.asciiz " e o valor da variavel (A).\n"
	.asciiz " e o valor da variavel (B). \n"
.text
main:

#recebe dados

#primeiro instrução
addi	$v0, $zero, 5 	# instrução syscall recebe um inteiro
syscall
add	$t1, $zero, $v0 

#segunda instrução
addi 	$v0, $zero, 5 	# instrução syscall recebe um inteiro
syscall
add	$t2, $zero, $v0

#primeira condição
slt	$t3, $t1, $t2 		#compara se $t1 < $t2
beq	$t3, $zero, if		#se $t3 == 0 vá para if
bne	$t3, $zero, else	#se $t3 != 0 vá para else



if:
	addi 	$v0, $zero, 1
	add 	$a0, $zero, $t1
	syscall
	
	addi 	$v0, $zero, 4
	lui 	$at, 0x1001
	ori	$a0, $at, 0x00000000
	syscall
	

	addi 	$v0, $zero, 1
	add 	$a0, $zero, $t2
	syscall
	
	addi	$v0, $zero, 4

	lui 	$at, 0x1001
	ori	$a0, $at, 0x0000001D
	syscall	
	
	j	final

else:


	addi 	$v0, $zero, 1
	add 	$a0, $zero, $t2
	syscall
	
	addi 	$v0, $zero, 4
	lui 	$at, 0x1001
	ori	$a0, $at, 0x00000000
	syscall
	

	addi 	$v0, $zero, 1
	add 	$a0, $zero, $t1
	syscall
	
	addi	$v0, $zero, 4

	lui 	$at, 0x1001
	ori	$a0, $at, 0x0000001D
	syscall	
	
	j	final

final:
		#return(0)
		addi $v0, $zero, 10		# instrução para o syscall terminar o programa
		syscall