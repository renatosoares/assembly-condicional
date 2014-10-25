# Desenvolva um programa que leia três números e mostre o maior.
.text
main:

# >>> coleta valores do usuário

addi 	$v0, $zero, 5
syscall
move 	$t0, $v0

addi 	$v0, $zero, 5
syscall
move 	$t1, $v0

addi 	$v0, $zero, 5
syscall
move 	$t2, $v0

# <<< coleta valores do usuário

# >>> primeiro if testando $t0 < $t1
slt 	$t3, $t0, $t1		# se $t0 for menor que $t1, armazene o resultado em $t3 (valor armazenado: 0 ou 1)
beq 	$t3, $zero, Elsif	# Se o resultado for falso (0) vá para Else
bnez	$t3, IFsegValor		# se $t3 for difernte de zero vá para etiqueta definida


Elsif:
slt	$t3, $t0, $t2
beq	$t3, $zero, imprimir
bnez	$t3, ElsifSegValor

imprimir:
li 	$v0, 1
move 	$a0, $t0
syscall

#    return(0);
li 	$v0, 10		# termina programa
syscall			# syscall(10) = termina programa

# <<< primeiro if testando $t0


# >>> segundo if testando $t2 < $t1

IFsegValor:
slt 	$t3, $t2, $t1
beq	$t3, $zero, ElsifSegValor
bnez	$t3, ElseSegValor

ElsifSegValor:
li 	$v0, 1
move 	$a0, $t2
syscall

#    return(0);
li 	$v0, 10		# termina programa
syscall			# syscall(10) = termina programa

ElseSegValor:
li 	$v0, 1
move	$a0, $t1
syscall

#    return(0);
li 	$v0, 10		# termina programa
syscall			# syscall(10) = termina programa

# <<< segundo if testando $t2 < $t1