# Desenvolva um programa que dado um número inteiro n,
# informe se o número é par ou ímpar.
.data
	.asciiz "Seu número é par"
	.asciiz "Seu número é ímpar"

.text
main:
# coleta numero
addi 	$v0, $zero, 5 		# instrução de coletade dados
syscall

add	$t1, $zero, $v0		# adiciona o valor da $v0 para $t1
addi	$t2, $zero, 2		#adicionar o valor 2 na $t2

div	$t1, $t2		#divisão do valor por 2
mfhi	$t3			#move o resto da divisão para $t3

beq	$t3, $zero, numpar	# se resto da divisão for igual a zero, vá para função numpar
bne	$t3, $zero, numimpar	# se resto da divisão for igual a zero, vá para função numimp

# função para imprimir número par
numpar:
	addi	$v0, $zero, 4
	lui	$a0, 0x1001
	syscall
	
	j	final


# função para imprimir número ímpar
numimpar:
	addi	$v0, $zero, 4
	lui	$a0, 0x1001
	addi	$a0, $a0, 0x11
	syscall
	
	j	final
final:
	#return(0)
	addi $v0, $zero, 10	# instrução para o syscall terminar o programa
	syscall



