programa
{
	inclua biblioteca Objetos --> ob
	inclua biblioteca Texto --> txt
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> ut
	inteiro refArquivo, x, refArquivo2, pnum = 0, segnum = 0, tamanho, posini = 0, final, cont =0, cont2 =0, finalaux, i = 0, tema = 0, questao, qntdquest, sorteio, h= 0, repetido = 0, pamonha = 0, k = 0, alternativaint, correto = 0, contador = 0,a = 0, pontos = 5, tem23[100][3], tamvet = 0, maxx = 0
	caracter resposta,resposta2, resposta3, mestatiscicas, gestatistica
	cadeia nome, aux, linha, linha2, refArquivocad, matriz[100][7], sortant[10], sorteiocad, alternativa, pergperg[10][3], temacad, qntquestcad, pontoscad //matriz 0
	logico fim = falso
	funcao inicio()
	{
	jogo()
	}


	funcao jogo(){
		faca{
			escreva ("DIGITE UM NÚMERO ENTRE 1 E 4\n")
			escreva ("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
			escreva ("\n1 - JOGAR\n")
			escreva ("\n2 - MELHORES JOGARES E PONTUAÇÃO\n")
			escreva ("\n3 - CRIADORES\n")
			escreva ("\n4 - SAIR\n")
			escreva ("\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
			leia(resposta)
			limpa()
		}enquanto(resposta != '1' e resposta != '2' e resposta != '3' e resposta != '4')
		se(resposta == '2'){ //se o usuário deseja olhar o placar de pessoas anteriores que jogaram
			refArquivo2 = arq.abrir_arquivo("./estat.txt", arq.MODO_LEITURA) //abre o arquivo no modo leitura
			enquanto(nao arq.fim_arquivo(refArquivo2)){ //lê até o fim do arquivo
				linha2 = arq.ler_linha(refArquivo2) // determina que linha é igual as linhas do arquivo
				escreva(linha2) // escreve as linhas do arquivo
			}
			arq.fechar_arquivo(refArquivo2)
			escreva("\nDeseja voltar ao menu principal?(S/N)") 
			leia(resposta2) // le a resposta dada pelo usuario
			
		enquanto(resposta2 != 'S' e resposta2 != 's' e resposta2 != 'N' e resposta2 != 'n'){
			escreva("Tente digitar (S ou N)")
			leia(resposta2)
		}
			se(resposta2 == 'S' ou resposta2 == 's'){
				limpa()
				jogo() //se a resposta for sim inicia novamente a função jogo
			}
			senao{
				se(resposta2 == 'N' e resposta2 == 'n'){
				escreva("Obrigado por jogar!")
				}
			}
		}
		
		se(resposta == '4'){ // se a resposta for 4 termina o jogo
			escreva("Obrigado por jogar!")
		}
		
		se(resposta == '3'){ // se a resposta for 3 mostra os criadores do jogo
			limpa()
			escreva("====================================================\n")
			escreva("PARTICIPARAM DA CRiAÇÃO DO JOGO:\n")
			escreva("\nARTHUR DE QUEIROZ\n")
			escreva("\nEDUARDO VOLLET DE SOUZA\n")
			escreva("\nGIANCARLO GILIOLI\n")
			escreva("\n====================================================\n")
			escreva("Deseja voltar ao menu principal?(S/N)")
			leia(resposta3)
			enquanto(resposta3 != 'S' e resposta3 != 's' e resposta3 != 'N' e resposta3 != 'n'){
				escreva("Tente digitar (S ou N)")
				leia(resposta3)
			}
				se(resposta3 == 'S' ou resposta3 == 's'){
					limpa()
					jogo() //se a resposta for sim inicia novamente a função  jogo
				}
				senao{
					se(resposta3 == 'N' e resposta3 == 'n'){
					escreva("Obrigado por jogar!")
					}
				}
		}
		se(resposta == '1'){ //se a resposta for 1 inicia o quiz
			limpa()		
			escreva("Digite o seu nome, jogador: ")
			leia(nome)
			limpa()

		refArquivo = arq.abrir_arquivo("./QUIZ.txt", arq.MODO_LEITURA) //Coloca dentro da matriz o arquivo com as perguntas
		
			enquanto (nao arq.fim_arquivo(refArquivo)){
				
			
				enquanto (cont < 101){
					linha = arq.ler_linha(refArquivo)
					fim = arq.fim_arquivo(refArquivo)
					se(fim == verdadeiro){
						pare
					}
													//txt.posição_texto(o texto que será procurado na cadeia, a cadeia dentro da qual o texto será procurado, a posição inicial a partir da qual o texto será procurado.)
													//txt.extrair_subtexto(a cadeia a partir da qual será extraído o subtexto, a posição dentro da cadeia onde começará o subtexto, a posição dentro da cadeia onde terminará o subtexto)
					tamanho = txt.numero_caracteres(linha) //tamanho = numero de caracteres do texto
					final = txt.posicao_texto(" | ", linha, posini) //final = procura pelo "|" no texto, permitindo a retirada da pergunta
					matriz[cont][0] = txt.extrair_subtexto(linha, 0, final)//Coloca as perguntas na matriz[x][0] tirando o pipe
					finalaux = txt.posicao_texto(" | ", linha, final+2)
					matriz[cont][1] = txt.extrair_subtexto(linha, final+3, finalaux)//Coloca os temas na matriz[x][1]. Adiciona mais 3 já que temos 3 caracteres em " | ", asssim pulando o pipe e começando a proxima parte da linha
					final = txt.posicao_texto(" | ", linha, finalaux+2)
					matriz[cont][2] = txt.extrair_subtexto(linha, finalaux+3, final) //Coloca as respostas na matriz[x][2]
					finalaux = txt.posicao_texto(" | ", linha, final+2)
					matriz[cont][3] = txt.extrair_subtexto(linha, final+3, finalaux) //Coloca as alternativas a) na matriz[x][3]
					final = txt.posicao_texto(" | ", linha, finalaux+2)
					matriz[cont][4] = txt.extrair_subtexto(linha, finalaux+3, final) //Coloca as alternativas b) na matriz[x][4]
					finalaux = txt.posicao_texto(" | ", linha, final+2)
					matriz[cont][5] = txt.extrair_subtexto(linha, final+3, finalaux) //Coloca as alternativas c) na matriz[x][5]
					matriz[cont][6] = txt.extrair_subtexto(linha, finalaux+3, tamanho) //Coloca as alternativas d) na matriz[x][6]
					
					cont++ //cont++ para ler a proxima linha até o final do contador	
					}
	
				arq.fim_arquivo(refArquivo)
				pare
			}

			para(inteiro p = 0; p < cont; p++){
				se(p == 0){
					//Marca onde incia a linha
					tem23[0][0] = p
					//conta a quantidade de peguntas
					tem23[0][2] = 0
				}
				senao{
					se(matriz[p][1] != matriz[p-1][1]){ //se tema atual da pergunta diferente do tema anterior
						tem23[cont2][1] = p-1 //Marca onde acaba a linha
						tem23[cont2][2] = p - tem23[cont2][0] //Determina a quantidade de perguntas. Subtrai do p(ultima linha com o tema) o tem23[cont2][0] (onde começou a linha desse tema)
						tem23[cont2+1][0] = p //Marca onde incia a proxima linha. Detemina o p como tem23[cont2+1][0], já que pega o cont2 que está com o valor da ultima linha do tema e adicona +1 para indicar que começou outro tema
						cont2++
					}
					//se o p for igual a ultima linha
					se(p == cont-1){
						tem23[cont2][1] = p	//Marca onde acaba a ultima linha
						tem23[cont2][2] = p - tem23[cont2][0] + 1
						pare
							
					}
				}

			}
									
			escreva("Qual tema deseja escolher: \n")
			para(inteiro b = 0; b< cont2+1; b++){
				escreva((b+1),"-",matriz[(tem23[b][0])][1],"\n") // O b serve como uma variavel auxiliar para rodar o loop e mostra onde começa cada linha
                                                                     // O b+1 serve para adicionar + 1 já que a matriz começa no 0 e é necessário exibir ao usuario do 1 ao 10
                                                                     // O tem23[b][0] serve para exibir a linha do tema dentro da matriz[(tem23[b][0])][1]
			}
			leia(tema) //pede para o usuário escolher o tema dentro do arquivo.txt que contém as perguntas
			escreva("Quantas questoes deseja (min 5, max ", tem23[tema-1][2], ")\n") //Faz a pergunta de quantas questões o usuario deseja responder
			leia(qntdquest) //le a quantidade de perguntas escolhida pelo usuario
			enquanto(qntdquest < 5 ou qntdquest > tem23[tema-1][2]){
				escreva("Tente escolher a quantidade (min 5, max",tem23[tema-1][2],")\n") // se o usuario escolher um numero menor ou maior de perguntas do que o permitido, pergunta novamente
				leia(qntdquest)
			}
			
			limpa()
			escolha(tema){ //dependendo do tema escolhido as caracteristicas das funções é alterada
			caso 1:
			x = 1
			escolhacaso(x)
			perguntas()
			caso 2:
			x = 2 
			escolhacaso(x)
			perguntas()
			caso 3:
			x=3
			escolhacaso(x)
			perguntas()
			caso 4:
			x = 4
			escolhacaso(x)
			perguntas()
			caso 5:
			x = 5
			escolhacaso(x)
			perguntas()
			caso 6:
			x = 6
			escolhacaso(x)
			perguntas()
			caso 7:
			x = 7
			escolhacaso(x)
			perguntas()
			caso 8:
			x = 8
			escolhacaso(x)
			perguntas()
			caso 9:
			x = 9
			escolhacaso(x)
			perguntas()
			caso 10: 
			x = 10
			escolhacaso(x)
			perguntas()
			}
			
			enquanto(contador < qntdquest){ //enquanto o contador for menor que a quantidade de perguntas, continua escrevendo a pergunta, a resposta correta e a resposta dada pelo jogador. Sempre mudando de pergunta quando adiciona mais 1 no a
				escreva("\nPergunta: ",pergperg[a][0],"\n")
				escreva("Resposta correta --> ", pergperg[a][2],"\n")
				escreva("Resposta dada por:", nome ," --> ",pergperg[a][1], "\n")
				contador++
				a++
			}
			escreva("Pontuação:", pontos, "\n")
			escreva("Deseja ir para as estatiscicas?(S/N)")
			leia(mestatiscicas)
			enquanto(mestatiscicas != 'S' e mestatiscicas != 's' e mestatiscicas != 'N' e mestatiscicas != 'n'){
				escreva("Resposta inválida. Tente S ou N")
				leia(mestatiscicas)
			}
			se(mestatiscicas == 'S' ou mestatiscicas == 's'){
				limpa()
				escreva("Nome do jogador: ",nome,"\n", "Tema: ", tema, "\n", "Quantidade de perguntas: ", qntdquest, "\n", "Pontuação:", pontos,"\n")
				escreva("Deseja gravar as estatisticas?(S/N)")
				leia(gestatistica)
				enquanto(mestatiscicas != 'S' e mestatiscicas != 's' e mestatiscicas != 'N' e mestatiscicas != 'n'){
					escreva("Resposta inválida. Tente S ou N")
					leia(gestatistica)
				}
				se(gestatistica == 'N' ou gestatistica == 'n'){
					limpa()
					escreva("Obrigado por jogar!")	
				}
				senao{
					se(gestatistica == 'S' ou gestatistica == 's'){ //Serve para salvar os dados do jogador no arquivo estatistica
					limpa()
					refArquivo2 = arq.abrir_arquivo("./estat.txt", arq.MODO_ACRESCENTAR) //abre o arquivo no modo acrescentar para não excluir o que já estava escrito dentro do .txt
					arq.escrever_linha("Nome:", refArquivo2)
					arq.escrever_linha(nome, refArquivo2)
					arq.escrever_linha(" Tema:",refArquivo2)
					temacad = tp.inteiro_para_cadeia(tema, 10)
					arq.escrever_linha(temacad, refArquivo2)
					arq.escrever_linha(" Quantidade de Questões:", refArquivo2)
					qntquestcad = tp.inteiro_para_cadeia(qntdquest, 10)
					arq.escrever_linha(qntquestcad, refArquivo2)
					arq.escrever_linha(" Pontos:", refArquivo2)
					pontoscad = tp.inteiro_para_cadeia(pontos, 10)
					arq.escrever_linha(pontoscad, refArquivo2)
					arq.escrever_linha(" | ", refArquivo2)
					arq.fechar_arquivo(refArquivo2)
					escreva("Gravado com sucesso!\n")
					escreva("Obrigado por jogar!")
					}
				}
			}
			senao{
				limpa()
				escreva("Obrigado por jogar!")			
			}
		}

		
	}
	funcao perguntas(){
			para(inteiro j = 0; j < qntdquest;j++){
			enquanto(tema == x){
				repetido = 0 //Sempre define como 0 repetido para se pegar um número que nâo foi sorteado e entrar no loop
				sorteio = ut.sorteia(pnum, segnum) //sorteia um número entre tem23[x-1][0](Onde começa a linha do tema escolhido) e tem23[numerodoescolha-1][1](Onde termina a linha do tema escolhido)
				sorteiocad = tp.inteiro_para_cadeia(sorteio, 10) //muda de inteiro para cadeia, já que nâo permite inteiro
				para(h = 0; h < tem23[tema-1][2];h++){
					se(sorteiocad == sortant[h]){ //se o número já foi sorteado, então coloca repetido 1 e reinicia o loop
						repetido = 1
					}
				}
				se(repetido == 0){
					sortant[pamonha] = sorteiocad
					pamonha += 1
					escreva("Pergunta: ",matriz[sorteio][0], "\n")
					escreva("1) ", matriz[sorteio][3], "\n")
					escreva("2) ", matriz[sorteio][4], "\n")
					escreva("3) ", matriz[sorteio][5], "\n")
					escreva("4) ", matriz[sorteio][6], "\n")
					leia(alternativa)
					se(alternativa == matriz[sorteio][2]){
						limpa()
						//armazena a pergunta
						pergperg[k][0] = matriz[sorteio][0]
						//armazena a alternativa escolhida pelo menino
						alternativaint = tp.cadeia_para_inteiro(alternativa, 10)
						//adiciona mais dois por causa das alternativas. Na matriz, 3 4 5 6 representam as altenativas, porém o usuario deve escolher entre 1 2 3 4
						pergperg[k][1] = matriz[sorteio][alternativaint+2]
						//armazena a alternativa correta
						pergperg[k][2] = matriz[sorteio][alternativaint+2]
						k++
						pontos++
					}
					senao{
						limpa()
						pergperg[k][0] = matriz[sorteio][0]
						//armazena a alternativa escolhida pelo menino
						alternativaint = tp.cadeia_para_inteiro(alternativa, 10)
						pergperg[k][1] = matriz[sorteio][alternativaint+2]
						//armazena a alternativa correta
						correto = tp.cadeia_para_inteiro(matriz[sorteio][2], 10)
						pergperg[k][2] = matriz[sorteio][correto+2]
						k++
						pontos--
					}
				}
				senao{
					//tira a questao que está repetida para que não afetar a quantidade escolhida
					j -= 1
				}
				pare
			}	
		}	
	}
	funcao escolhacaso(inteiro numerodoescolha){
		pnum = tem23[numerodoescolha-1][0] //dependendo do tema escolhido no escolha caso, muda o pnum = onde começa as perguntas do tema no .txt
		segnum = tem23[numerodoescolha-1][1] //dependendo do tema escolhido no escolha caso, muda o pnum = onde termina as perguntas do tema no .txt
		maxx = tem23[numerodoescolha-1][2]
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2581; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tem23, 8, 263, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */