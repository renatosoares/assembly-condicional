# Desenvolva um programa que leia as duas notas de um aluno nota1 e
# nota2 e informe se o aluno passou, considerando o cálculo da média do
# IFRN.


	.data
aprovadonome:	.asciiz  "Aprovado"
	
	
reprovadonome:	.asciiz  "reprovado"


.text
main:

#nota 01
addi 	$v0, $zero, 5
syscall 
add 	$t1, $zero, $v0

#nota 02
addi 	$v0, $zero, 5
syscall
add 	$t2, $zero, $v0

#multiplica o primeiro valor coletado
addi 	$t0, $zero, 2
mul 	$t1, $t0, $t1

#multiplica o segundo valor coletado
addi 	$t0, $zero, 3
mul	$t2, $t0, $t2

#soma dos valores multiplicados
add	$t3, $t2, $t1

#divisão do valor por 5, que resultará na média
addi 	$t0, $zero, 5
div	$t3, $t3, $t0

# conparação de $t3 < 60
addi 	$t0, $zero, 60
slt	$t0, $t3, $t0
beq	$zero, $t0, aprovado
bne	$zero, $t0, reprovado

#reprovado
reprovado:

	addi 	$v0, $zero, 4
	#la	$a0, reprovadonome
	lui 	$at, 0x1001       # $a0 = 0x10010000
	ori	$a0, $at, 0x00000009
	syscall
#    return(0);
	addi 	$v0, $zero, 10	# termina programa
	syscall			# syscall(10) = termina programa

#resultado do aprovado
aprovado:

	addi 	$v0, $zero, 4
	#la 	$a0, aprovadonome	
	lui 	$at, 0x1001       # $a0 = 0x10010000
	ori	$a0, $at, 0x00000000
		
		
	syscall
#    return(0);
	addi 	$v0, $zero, 10	# termina programa
	syscall			# syscall(10) = termina programa



