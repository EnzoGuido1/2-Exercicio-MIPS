#-----------------------------------------------------------------------------------------------------------------------------
# ALUNO: ENZO GUIDO AMERICANO DA COSTA       MATRICULA: 202000560432
#-----------------------------------------------------------------------------------------------------------------------------

.data #cont�m as mensagens de texto que ser�o printadas no programa

vetor: .word -2, 4, 7, -3, 0, -3, 5, 6 #vetor com os valores inteiros positivos e negativos
msg1: .asciiz "A soma dos valores positivos = "
msg2: .asciiz "A soma dos valores negativos = "
msg3: .asciiz "\n"

.text #cont�m as fun��es que ser�o utilizadas no programa

main: #cont�m as fun��es que ser�o utilizadas no programa
	add $a1,$zero,$zero #zera o valor contido em $a1, $a1 ir� armazenar o endere�o do vetor "word", incrementa 4 cada vez que for avan�ar uma posi��oo do vetor por conta do sistema 32 bits
	add $t0,$zero,$zero #zera o valor contido em $a0, $a0 ir� armazenar o endere�o de uma posi��o espec�fica do vetor "word"
	add $s0,$zero,$zero #zera o valor contido em $s0, $s0 ir� armazenar a soma dos valores positivos do vetor "word"
	add $s1,$zero,$zero #zera o valor contido em $s1, $s1 ir� armazenar a soma dos valores negativos do vetor "word"
	add $s2,$zero,$zero #zera o valor contido em $s2, $s2 ir� servir como contador para o tamanho do vetor
	add $k0,$zero,8 #zera o valor contido em $k0, $k0 ir� armazenar o tamanho do vetor "word"
	
	la $a1,vetor #carrega o endere�o do vetor "word"
	lw $t0,0($a1) #carrega o endere�o da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits), neste caso sempre posi��o 0
	j read #pula para a branch "read"
	
	read: #branch read, realiza a leitura da posi��o $s2 (ou posi��o $a0 em sistema 32 bits)
		lw $t0,0($a1) #carrega o endere�o da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits)
		beq $s2,$k0,ending #caso $s2 (contador para de 0 at� tamanho do vetor mais 1) seja igual a $k0 (tamanho do vetor mais 1), vai para a branch "ending"
		bgtz $t0,positive #caso $t0 (endere�o da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits)) seja positivo, vai para a branch positive
		blez $t0,negative #caso $t0 (endere�o da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits)) seja negativo, vai para a branch negative
		
	positive: #branch positive, caso o valor $t0 (da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits)) seja positivo realiza a soma nos valores positivos
		add $s0,$s0,$t0 #armazena em $s0 (soma dos valores positivos) a soma de $s0 com $t0
		add $a1,$a1,4 #armazena em $a1 (posi��o atual do vetor) a soma de $a1 mais 4(por conta do sistema 32 bits)
		add $s2,$s2,1 #armazena em $s2 (contador para o tamanho do vetor) a soma de $s2 mais 1
		j read #pula para a branch "read"
		
	negative: #branch negative, caso o valor $t0 (da posi��o $s2 do vetor (ou posi��o $a0 em sistema 32 bits)) seja negativo realiza a soma nos valores negativos
		add $s1,$s1,$t0 #armazena em $s1 (soma dos valores negativos) a soma de $s1 mais $t0
		add $a1,$a1,4 #armazena em $a1 (posi��o atual do vetor) a soma de $a1 mais 4(por conta do sistema 32 bits)
		add $s2,$s2,1 #armazena em $s2 (contador para o tamanho do vetor) a soma de $s2 mais 1
		j read #pula para a branch "read"
		
	ending: #final do programa, imprime a mensagem final com o valor da soma dos valores positivos e negativos
		li $v0,4 #c�digo syscall para imprimir strings
		la $a0,msg1 #carrega o endere�o de msg1 em a0
		syscall #emite uma chamada do sistema
		li $v0,1 #c�digo syscall para imprimir inteiros
		add $a0,$s0,$zero #$a0 recebe o valor de $s0 (soma dos valores positivos) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #c�digo syscall para imprimir strings
		la $a0,msg3 #carrega o endere�o de msg3 em a0
		syscall #emite uma chamada do sistema
		li $v0,4 #c�digo syscall para imprimir strings
		la $a0,msg2 #carrega o endere�o de msg2 em a0
		syscall #emite uma chamada do sistema
		li $v0,1 #c�digo syscall para imprimir inteiros
		add $a0,$s1,$zero #$a0 recebe o valor de $s1 (soma dos valores negativos) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #c�digo syscall para imprimir strings
		la $a0,msg3 #carrega o endere�o de msg3 em a0
		syscall #emite uma chamada do sistema

	
	
	
		
	
	
	