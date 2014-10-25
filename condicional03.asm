# Desenvolva um programa que leia dois números e mostre o maior.

.text
main:

addi $v0, $zero, 5 # comando para syscall input
syscall

move $t0, $v0 # move o que o usuário digitou para o registrador $t0 

addi $v0, $zero, 5 # comando para syscall input
syscall

move $t1, $v0 # move o que o usuário digitou para o registrador $t1

sub $t2, $t0, $t1 #subitração do primeiro número pelo segundo

srl $t3, $t2, 31 # deslocamento para direita de 31 bits do resultado da subitração

beq $t3, $zero, maior # compara o resultado da subtração de $t0 - $t1 e chama a função maior caso o primeiro número seja o maior

move $a0, $t1 # move o que está no $t1 sedo que ele é o maior

add $v0, $zero, 1 # printa na tela o segundo número como sendo o maior
syscall

beq $zero, $zero, fim # chama a função fim

maior: # funçao maior
move $a0, $t0 	#ele saiu do beq de comparação onde chama a função maior e veio pra cá.
		#E agora ele tá colocando o primeiro numero no registrador onde será printada a mensagem do maior número para a humanidade.

add $v0, $zero,  1 # aqui printa
syscall

beq $zero, $zero, fim #chama função fim

fim: # e fim
nop # no operation
