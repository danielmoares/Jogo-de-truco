programa {
  inclua biblioteca Util --> u
  inclua biblioteca Texto --> t
  cadeia jogador1[3]
  cadeia jogador2[3]

  cadeia opcao
  cadeia jogador1menu
  cadeia jogador2menu
  cadeia jogofinalizado

  inteiro num_de_maos = 24
  inteiro jogada = 0
  inteiro acha_posicao = 0
 
  inteiro carta_escolhida_1 = 0
  inteiro carta_escolhida_2 = 0

  cadeia vencedor_anterior = ""

  logico uso_da_carta[40]

  cadeia nome_de_cartas[40] = {
  "1 DE PAUS", "2 DE PAUS", "3 DE PAUS", "4 DE PAUS", "5 DE PAUS", "6 DE PAUS", "7 DE PAUS", "10 DE PAUS", "11 DE PAUS", "12 DE PAUS",
  "1 DE OURO", "2 DE OURO", "3 DE OURO", "4 DE OURO", "5 DE OURO", "6 DE OURO", "7 DE OURO", "10 DE OURO", "11 DE OURO", "12 DE OURO",
  "1 DE ESPADA", "2 DE ESPADA", "3 DE ESPADA", "4 DE ESPADA", "5 DE ESPADA", "6 DE ESPADA", "7 DE ESPADA", "10 DE ESPADA", "11 DE ESPADA", "12 DE ESPADA",
  "1 DE COPAS", "2 DE COPAS", "3 DE COPAS", "4 DE COPAS", "5 DE COPAS", "6 DE COPAS", "7 DE COPAS", "10 DE COPAS", "11 DE COPAS", "12 DE COPAS"}

  inteiro pontuacao_das_cartas[40] = {
  39, 36, 37, 28, 29, 30, 31, 32, 33, 34,
  35, 36, 37, 28, 29, 30, 37, 32, 33, 34,
  40, 36, 37, 28, 29, 30, 38, 32, 33, 34,
  35, 36, 37, 28, 29, 30, 31, 32, 33, 34}

  inteiro pontos_jogador1 = 0
  inteiro pontos_jogador2 = 0

  inteiro contador_vitoria_mao_jog_1 = 0
  inteiro contador_vitoria_mao_jog_2 = 0

  inteiro mao = 0

  funcao inicio() {
  menu()
  enquanto(opcao == "1" ou opcao == "2" ou opcao == "3"){
    se(opcao == "1"){
      contador_vitoria_mao_jog_1 = 0
      contador_vitoria_mao_jog_2 = 0
      limpa()
      insercao_jogadores()
      faca{
        mao++
        escreva("\n--------------------------------------------------")
        escreva("\n             VAMO INCIAR A: ", mao, "ª MÃO          ")
        escreva("\n--------------------------------------------------") 
        entrega_tres_cartas(jogador1)
        entrega_tres_cartas(jogador2)
        para(inteiro rodada = 1; rodada < 4; rodada++) {
          escreva("\n____________________ JOGADA ", rodada, " ____________________\n")
          // Determina ordem de vitória
          verifica_ordem_jogadores(rodada)
          // Resultado da rodada
          vitoria_da_mao()
          // Jogador == 2pontos - Fim de rodada
          se(pontos_jogador1 == 2){
            pare
          }
          se(pontos_jogador2 == 2){
            pare
          }
        }
        // Resultado final do jogo
        mostra_resultado_final()
        placar_atual()
        reseta_cartas()
      }enquanto(contador_vitoria_mao_jog_1 < num_de_maos e contador_vitoria_mao_jog_2 < num_de_maos)
      exibe_vencedor() 
    }
    se(opcao == "2"){
      limpa()
      escreva("-----------------------\n")
      escreva("    JOGO FINALIZADO    ")
      escreva("\n-----------------------")
      pare
    }
    se(opcao == "3"){
      mostra_regras()
    }
      escreva("[1] - INICIAR\n[2] - FINALIZAR JOGO\n[3] - VER REGRAS\n","DIGITE A OPÇÃO: ")
      leia(opcao)
      verificar_erro_opcao(opcao)
    }
  }

  funcao entrega_tres_cartas(cadeia jogador[]){
    inteiro carta_sorteada
    para(inteiro contador = 0; contador < 3; contador){ // Contador somado quando há uma carta diponível
      carta_sorteada = u.sorteia(0, 39)
      se(uso_da_carta[carta_sorteada] == verdadeiro){
      }
      senao{
        jogador[contador] = nome_de_cartas[carta_sorteada]
        contador++
        uso_da_carta[carta_sorteada] = verdadeiro
      }
    }
  }

  funcao verifica_ordem_jogadores(inteiro rodada){
    inteiro aleatorio
    se(mao == 1 e rodada == 1){
      aleatorio = u.sorteia(1, 2)
      se(aleatorio == 1){
        jogada_jogador1()
        escreva("\n")
        jogada_jogador2()
      }
      se(aleatorio == 2){
        jogada_jogador2()
        escreva("\n")
        jogada_jogador1()
      }
    }
    senao{
      se(vencedor_anterior == jogador1menu){
        jogada_jogador1()
        escreva("\n")
        jogada_jogador2()
      }senao{
        jogada_jogador2()
        escreva("\n")
        jogada_jogador1()
      }
    }
  }

  funcao insercao_jogadores(){
    escreva("--> ÓTIMO! INSIRA OS JOGADORES <--\n")
    escreva("DIGITE O NOME DO 1º JOGADOR: ")
    leia(jogador1menu)
    escreva("DIGITE O NOME DO 2º JOGADOR: ")
    leia(jogador2menu)
    vencedor_anterior = jogador1menu
    escreva("\nJOGADOR 01: ", jogador1menu, "\nJOGADOR 02: ", jogador2menu, "\n")
  }

  funcao reseta_cartas(){
    para(inteiro i = 0; i < 40; i++){
      uso_da_carta[i] = falso
    }
    pontos_jogador1 = 0
    pontos_jogador2 = 0
  }

  funcao vitoria_da_mao(){
    se(carta_escolhida_1 > carta_escolhida_2){
      escreva("\n\n[[[ VITÓRIA! JOGADOR 01 (", jogador1menu,") ]]]\n")
      pontos_jogador1++
      vencedor_anterior = jogador1menu
    }
    senao se(carta_escolhida_2 > carta_escolhida_1){
      escreva("\n\n[[[ VITÓRIA! JOGADOR 02 (", jogador2menu,") ]]]\n")
      pontos_jogador2++
      vencedor_anterior = jogador2menu
    }
    senao{
      escreva("\n\n[[[ EMPATE ]]]")
    }
  }

  funcao mostra_carta_para_jogadores(cadeia jogador[]){
    para(inteiro i = 0; i < 3; i++){
      se(jogador[i] != " "){
        escreva("[",i + 1,"] ", jogador[i], "\n")
      }
    }

  }

  funcao exibe_vencedor(){
    se(contador_vitoria_mao_jog_1 > contador_vitoria_mao_jog_2){
      escreva("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
      escreva("\n          PARABÉNS!!! ", t.caixa_alta(jogador1menu))
      escreva("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
     }
    senao{
      escreva("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
      escreva("\n          PARABÉNS!!! ", t.caixa_alta(jogador2menu))
      escreva("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
    }
    escreva("\n\nJOGO FINALIZADO\n\n")
  }

  funcao encontra_pontuacao_da_carta(cadeia jogador[]){
    para(inteiro i = 0; i < 40; i++){
      se(jogador[jogada - 1] == nome_de_cartas[i]){
        acha_posicao = i
      }
    }
  }

  funcao verifica_jogada(cadeia jogador[], inteiro jogada, logico carta_escolhida){
    escreva(jogador[jogada - 1], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    se(carta_escolhida){
      carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
    }senao{
      carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
    }
    jogador[jogada - 1] = " "
  }

  funcao menu(){
    escreva("+-+-+-+-+-+-+-+-+-+-+-+-+-+-\n")
    escreva("+        TRUCO GAÚCHO      +\n")
    escreva("+-+-+-+-+-+-+-+-+-+-+-+-+-+-\n") 
    escreva("--->  ESCOLHA UM OPÇÃO  <---\n")
    escreva("[1] - INICIAR\n[2] - FINALIZAR JOGO\n[3] - VER REGRAS\n","DIGITE A OPÇÃO: ")
    leia(opcao)
    verificar_erro_opcao(opcao)
  }

  funcao placar_atual(){
    escreva("\n\n//// ACOMPANHE O PLACAR DO JOGO ////\n")
    escreva("JOGADOR 01 (" , jogador1menu, "): ", contador_vitoria_mao_jog_1)
    escreva("\nJOGADOR 02 (" , jogador2menu, "): ", contador_vitoria_mao_jog_2, "\n")
  }

  funcao verificar_erro_jogada(cadeia jogador[]){
    inteiro verificar_posicao = 1
    se(jogada > 1 e jogada < 4){
      verificar_posicao = jogada
    }
    enquanto(jogada > 3 ou jogada < 1 ou jogador[verificar_posicao - 1] == " "){
      escreva("OPS! OPÇÃO INVÁLIDA\n")
      escreva("QUAL VOCÊ DESEJA JOGAR: ")
      leia(jogada)
      se(jogada > 1 e jogada < 4){
        verificar_posicao = jogada
      }
    }
  }

  funcao verificar_erro_opcao(cadeia opc_escolhida){
    enquanto(opcao != "1" e opcao != "2" e opcao != "3"){
      escreva("OPS! VOCÊ ESCOLHEU UMA OPÇÃO INVÁLIDA\n")
      escreva("[1] - INICIAR JOGO\n[2] - FINALIZAR JOGO\n[3] - VER REGRAS\n")
      escreva("DIGITE NOVAMENTE: ")
      leia(opcao)
   }
  }

  funcao jogada_jogador1(){
    escreva("\nVEJA SUAS CARTAS: JOGADOR 01 (", jogador1menu, ")\n")
    mostra_carta_para_jogadores(jogador1)
    escreva("QUAL VOCÊ DESEJA JOGAR: ")
    leia(jogada)
    verificar_erro_jogada(jogador1)
    encontra_pontuacao_da_carta(jogador1)
    verifica_jogada(jogador1, jogada, verdadeiro)
  }

  funcao jogada_jogador2(){
    escreva("\nVEJA SUAS CARTAS: JOGADOR 02 (", jogador2menu, ")\n")    
    mostra_carta_para_jogadores(jogador2)
    escreva("QUAL VOCÊ DESEJA JOGAR: ")
    leia(jogada)
    verificar_erro_jogada(jogador2)
    encontra_pontuacao_da_carta(jogador2)
    verifica_jogada(jogador2, jogada, falso)
  }

  funcao mostra_regras(){
  escreva("\n\n--------------------------------------------------\n")
  escreva("              REGRAS DO TRUCO GAÚCHO             \n")
  escreva("--------------------------------------------------\n\n")
  escreva("Objetivo: Ser o primeiro a atingir 24 pontos.\n\n")
  escreva("Cartas (da mais forte para a mais fraca):\n\n")
  
  escreva("Paus:\n")
  escreva("1 de Paus (Espadilha) - 39 pontos\n")
  escreva("2 de Paus - 36 pontos\n")
  escreva("3 de Paus (Zap) - 37 pontos\n")
  escreva("4 de Paus - 28 pontos\n")
  escreva("5 de Paus - 29 pontos\n")
  escreva("6 de Paus - 30 pontos\n")
  escreva("7 de Paus - 31 pontos\n")
  escreva("11 de Paus - 32 pontos\n")
  escreva("12 de Paus - 33 pontos\n")
  escreva("13 de Paus - 34 pontos\n\n")
  
  escreva("Copa:\n")
  escreva("1 de Copa - 35 pontos\n")
  escreva("2 de Copa - 36 pontos\n")
  escreva("3 de Copa - 37 pontos\n")
  escreva("4 de Copa - 28 pontos\n")
  escreva("5 de Copa - 29 pontos\n")
  escreva("6 de Copa - 30 pontos\n")
  escreva("7 de Copa - 31 pontos\n")
  escreva("11 de Copa - 32 pontos\n")
  escreva("12 de Copa - 33 pontos\n")
  escreva("13 de Copa - 34 pontos\n\n")
  
  escreva("Espada:\n")
  escreva("1 de Espada (Espadilha) - 40 pontos\n")
  escreva("2 de Espada - 36 pontos\n")
  escreva("3 de Espada - 37 pontos\n")
  escreva("4 de Espada - 28 pontos\n")
  escreva("5 de Espada - 29 pontos\n")
  escreva("6 de Espada - 30 pontos\n")
  escreva("7 de Espada - 38 pontos\n") 
  escreva("11 de Espada - 32 pontos\n")
  escreva("12 de Espada - 33 pontos\n")
  escreva("13 de Espada - 34 pontos\n\n")
  
  escreva("Ouro:\n")
  escreva("1 de Ouro - 35 pontos\n")
  escreva("2 de Ouro - 36 pontos\n")
  escreva("3 de Ouro - 37 pontos\n")
  escreva("4 de Ouro - 28 pontos\n")
  escreva("5 de Ouro - 29 pontos\n")
  escreva("6 de Ouro - 30 pontos\n")
  escreva("7 de Ouro - 37 pontos\n")
  escreva("11 de Ouro - 32 pontos\n")
  escreva("12 de Ouro - 33 pontos\n")
  escreva("13 de Ouro - 34 pontos\n\n")
  
  escreva("Distribuição de Cartas:\n")
  escreva("Cada jogador recebe 3 cartas no início de cada rodada.\n\n")
  
  escreva("Rodadas:\n")
  escreva("O jogo tem 3 rodadas. Quem vencer 2 rodadas ganha 1 ponto.\n\n")
  }

  funcao mostra_resultado_final(){
    escreva("\n\n=============== RESULTADO DA MÃO =================\n")
      escreva("Pontuação do Jogador 1: ", pontos_jogador1, "\n")
      escreva("Pontuação do Jogador 2: ", pontos_jogador2, "\n")
      se(pontos_jogador1 > pontos_jogador2){
        escreva("+1+1+1+1+ VITÓRIA DA MÃO! JOGADOR 1 (", jogador1menu, ") +1+1+1+1+")
        contador_vitoria_mao_jog_1++
      } senao se(pontos_jogador2 > pontos_jogador1) {
        escreva("+2+2+2+2+ VITÓRIA DA MÃO! JOGADOR 2 (", jogador2menu, ") +2+2+2+2+")
        contador_vitoria_mao_jog_2++
      } senao {
        escreva("-1-2-1-2-1-2-1-2-1- EMPATE FINAL -1-2-1-2-1-2-1-2-1-")
      }
  }
}