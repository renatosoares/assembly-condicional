# Desenvolva um programa que leia 5 números
# e informe o maior e o menor.
	
.text
main:
# coleta valores
addi	$v0, $zero, 5
syscall
add 	$t1, $zero, $v0

addi 	$v0, $zero, 5
syscall	
add	$t2, $zero, $v0

addi	$v0, $zero, 5
syscall
add	$t3, $zero, $v0

addi 	$v0, $zero, 5
syscall	
add	$t4, $zero, $v0

addi 	$v0, $zero, 5
syscall	
add	$t5, $zero, $v0

# compara valores da memória >>> fase 1
slt	$t7, $t1, $t2		# se $t1 < $t2 => $t7 == 1
slt	$t8, $t3, $t4		# se $t1 < $t2 => $t8 == 1

# armazenando valores testados - etapa 1
beq	$t7, $zero, recebeMaiort1 	# $t1 > $t2
bne	$t7, $zero, recebeMaiort2	# $t1 < $t2

	recebeMaiort1:
		add 	$s0, $zero, $t1
		j	recebeMenort2
	recebeMenort2:
		add 	$a1, $zero, $t2
		j	etapa2
	
	recebeMaiort2:
		add 	$s0, $zero, $t2
		j	recebeMenort1
	recebeMenort1:
		add 	$a1, $zero, $t1
	
# armazenando valore testados - etapa 2	
etapa2:
beq	$t8, $zero, recebeMaiort3	# $t3 > $t4
bne	$t8, $zero, recebeMaiort4	# $t3 < $t4

	recebeMaiort3:
		add 	$s1, $zero, $t3
		j	recebeMenort4
	recebeMenort4:
		add 	$a2, $zero, $t4	
		j	comparaFase2

	recebeMaiort4:
		add	$s1, $zero, $t4
		j	recebeMenort3
	recebeMenort3:
		add	$a2, $zero, $t3
		
# compara valores da memória >>> fase 2
comparaFase2:
slt	$t8, $s0, $s1	#compara valores maiores
slt	$t9, $a1, $a2	#compara valores menores

#armazena valores testados - etapa 3
etapa3:
beq	$t8, $zero, recebeMaiors0 	# $s0 > $s1
bne	$t8, $zero, recebeMaiors1	#$s0 < $s1

	recebeMaiors0:
		add	$t6, $zero, $s0
		j	etapa4
		

	recebeMaiors1:	
		add	$t6, $zero, $s1
		
#armazena valores testados - etapa 4
etapa4:
bne	$t9, $zero, recebeMenora1
beq	$t9, $zero, recebeMenora2

	recebeMenora1:
		add	$t0, $zero, $a1
		j	comparaFase3

	recebeMenora2:
		add	$t0, $zero, $a2
		
# compara valores da memória >>> fase 3
comparaFase3:
slt	$t8, $t5, $t6	#compara valores maiores
slt	$t9, $t5, $t0	#compara valores menores

#armazena valores testados - etapa 5
etapa5:
beq	$t8, $zero, maiorValort5
bne	$t8, $zero, maiorValort6

	maiorValort5:
		addi	$v0, $zero, 1
		add	$a0, $zero, $t5
		syscall
		
		j	valoresMenores

	maiorValort6:
		addi	$v0, $zero, 1
		add	$a0, $zero, $t6
		syscall
		
		j	valoresMenores
		
#armazena valores testados - etapa 6
valoresMenores:
beq	$t9, $zero, menorValort0
bne	$t9, $zero, menorValort5

	menorValort0:
		addi 	$v0, $zero, 1
		add	$a0, $zero, $t0
		syscall
		
		j	final

	menorValort5:
		addi	$v0, $zero, 1
		add	$a0, $zero, $t5
		syscall
		
		j	final
final:
	#return(0)
	addi	$v0, $zero, 10
	syscall	
	






		
		

	
	

