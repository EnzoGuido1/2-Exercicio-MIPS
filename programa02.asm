#-----------------------------------------------------------------------------------------------------------------------------
# ALUNO: ENZO GUIDO AMERICANO DA COSTA       MATRICULA: 202000560432
#-----------------------------------------------------------------------------------------------------------------------------

.data #contém as mensagens de texto que serão printadas no programa

vetor: .word -2, 4, 7, -3, 0, -3, 5, 6 #vetor com os valores inteiros positivos e negativos
msg1: .asciiz "A soma dos valores positivos = "
msg2: .asciiz "A soma dos valores negativos = "
msg3: .asciiz "\n"

.text #contém as funções que serão utilizadas no programa

main: #contém as funções que serão utilizadas no programa
	add $a1,$zero,$zero #zera o valor contido em $a1, $a1 irá armazenar o endereço do vetor "word", incrementa 4 cada vez que for avançar uma posiçãoo do vetor por conta do sistema 32 bits
	add $t0,$zero,$zero #zera o valor contido em $a0, $a0 irá armazenar o endereço de uma posição específica do vetor "word"
	add $s0,$zero,$zero #zera o valor contido em $s0, $s0 irá armazenar a soma dos valores positivos do vetor "word"
	add $s1,$zero,$zero #zera o valor contido em $s1, $s1 irá armazenar a soma dos valores negativos do vetor "word"
	add $s2,$zero,$zero #zera o valor contido em $s2, $s2 irá servir como contador para o tamanho do vetor
	add $k0,$zero,8 #zera o valor contido em $k0, $k0 irá armazenar o tamanho do vetor "word"
	
	la $a1,vetor #carrega o endereço do vetor "word"
	lw $t0,0($a1) #carrega o endereço da posição $s2 do vetor (ou posição $a0 em sistema 32 bits), neste caso sempre posição 0
	j read #pula para a branch "read"
	
	read: #branch read, realiza a leitura da posição $s2 (ou posição $a0 em sistema 32 bits)
		lw $t0,0($a1) #carrega o endereço da posição $s2 do vetor (ou posição $a0 em sistema 32 bits)
		beq $s2,$k0,ending #caso $s2 (contador para de 0 até tamanho do vetor mais 1) seja igual a $k0 (tamanho do vetor mais 1), vai para a branch "ending"
		bgtz $t0,positive #caso $t0 (endereço da posição $s2 do vetor (ou posição $a0 em sistema 32 bits)) seja positivo, vai para a branch positive
		blez $t0,negative #caso $t0 (endereço da posição $s2 do vetor (ou posição $a0 em sistema 32 bits)) seja negativo, vai para a branch negative
		
	positive: #branch positive, caso o valor $t0 (da posição $s2 do vetor (ou posição $a0 em sistema 32 bits)) seja positivo realiza a soma nos valores positivos
		add $s0,$s0,$t0 #armazena em $s0 (soma dos valores positivos) a soma de $s0 com $t0
		add $a1,$a1,4 #armazena em $a1 (posição atual do vetor) a soma de $a1 mais 4(por conta do sistema 32 bits)
		add $s2,$s2,1 #armazena em $s2 (contador para o tamanho do vetor) a soma de $s2 mais 1
		j read #pula para a branch "read"
		
	negative: #branch negative, caso o valor $t0 (da posição $s2 do vetor (ou posição $a0 em sistema 32 bits)) seja negativo realiza a soma nos valores negativos
		add $s1,$s1,$t0 #armazena em $s1 (soma dos valores negativos) a soma de $s1 mais $t0
		add $a1,$a1,4 #armazena em $a1 (posição atual do vetor) a soma de $a1 mais 4(por conta do sistema 32 bits)
		add $s2,$s2,1 #armazena em $s2 (contador para o tamanho do vetor) a soma de $s2 mais 1
		j read #pula para a branch "read"
		
	ending: #final do programa, imprime a mensagem final com o valor da soma dos valores positivos e negativos
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg1 #carrega o endereço de msg1 em a0
		syscall #emite uma chamada do sistema
		li $v0,1 #código syscall para imprimir inteiros
		add $a0,$s0,$zero #$a0 recebe o valor de $s0 (soma dos valores positivos) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg3 #carrega o endereço de msg3 em a0
		syscall #emite uma chamada do sistema
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg2 #carrega o endereço de msg2 em a0
		syscall #emite uma chamada do sistema
		li $v0,1 #código syscall para imprimir inteiros
		add $a0,$s1,$zero #$a0 recebe o valor de $s1 (soma dos valores negativos) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg3 #carrega o endereço de msg3 em a0
		syscall #emite uma chamada do sistema

	
	
	
		
	
	
	