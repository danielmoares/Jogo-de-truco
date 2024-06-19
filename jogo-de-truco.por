programa {
  inclua biblioteca Util --> u
  inteiro contador = 0
  cadeia jogador1[3]
  cadeia jogador2[3]

  cadeia opcao
  cadeia jogador1menu
  cadeia jogador2menu
  cadeia jogofinalizado

  inteiro jogada = 0
  inteiro acha_posicao = 0
 
  inteiro carta_escolhida_1 = 0
  inteiro carta_escolhida_2 = 0

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


  funcao inicio() {
  menu()
  fluxo_do_jogo()


  }
  funcao cadeia entrega_tres_cartas(cadeia vetor[]){
    inteiro carta_sorteada
    para(contador = 0; contador < 3; contador){
      carta_sorteada = u.sorteia(0, 39)
      se(uso_da_carta[carta_sorteada] == verdadeiro){
      }senao{
          vetor[contador] = nome_de_cartas[carta_sorteada]
          contador++
          uso_da_carta[carta_sorteada] = verdadeiro
        }  
      }
    retorne vetor
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
      escreva("\n\nVITÓRIA! PLAYER 01")
      pontos_jogador1++
    }
    senao se(carta_escolhida_2 > carta_escolhida_1){
      escreva("\n\nVITÓRIA! PLAYER 02")
      pontos_jogador2++
    }
    senao{
      escreva("\n\nEMPATE")
    }
  }

  funcao cadeia mostra_carta_para_jogadores(cadeia jogador[]){
    para(inteiro i = 0; i < 3; i++){
      se(jogador[i] != " "){
        escreva("[",i + 1,"] ", jogador[i], "\n")
      }
    }
    retorne jogador
  }

  funcao cadeia encontra_pontuacao_da_carta(cadeia jogador[]){
    para(inteiro i = 0; i < 40; i++){
      se(jogador[jogada - 1] == nome_de_cartas[i]){
        acha_posicao = i
      }
    }
    retorne jogador
  }

  funcao verifica_jogada(cadeia jogador[], logico carta_escolhida){
    se(jogada == 1){
      escreva(jogador[0], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
       se(carta_escolhida){
        carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
      }senao{
        carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
      }
      jogador[0] = " "
    }
    se(jogada == 2){
      escreva(jogador[1], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
       se(carta_escolhida){
        carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
      }senao{
        carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
      }
      jogador[1] = " "
    }
    se(jogada == 3){
      escreva(jogador[2], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
       se(carta_escolhida){
        carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
      }senao{
        carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
      }
      jogador[2] = " "
    }
  }

  funcao menu(){
    escreva("::::::::: MENU :::::::::\n")
    escreva("OLÁ!!!\n","SEJA BEM-VINDO AO NOSSO JOGO\n", "[S] - Sim ou [N] - Não\n","DESEJA INICIAR O JOGO? ")
    leia(opcao)
  }

  funcao placar_atual(){
    escreva("\n__ACOMPANHE O PLACAR DO JOGO__\n")
    escreva("JOGADOR 01: ", contador_vitoria_mao_jog_1)
    escreva("\nJOGADOR 02: ", contador_vitoria_mao_jog_2)
  }

  funcao verificar_erro(cadeia jogador[]){
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

  funcao fluxo_do_jogo(){
    inteiro mao = 0
    se(opcao == "sim" ou opcao == "s"){
    limpa()
    escreva("--> ÓTIMO! INSIRA OS JOGADORES <--\n")
    escreva("DIGITE O NOME DO 1º JOGADOR: ")
    leia(jogador1menu)
    escreva("DIGITE O NOME DO 2º JOGADOR: ")
    leia(jogador2menu)

    escreva("\nPLAYER 01: ", jogador1menu, "\nPLAYER 02: ", jogador2menu, "\n")
    faca{
      mao++
      escreva("\n-------- VAMO INCIAR A: ", mao, "ª MÃO ---------")
      entrega_tres_cartas(jogador1)
      entrega_tres_cartas(jogador2)
      para(inteiro rodada = 1; rodada < 4; rodada++) {
        escreva("\n\n:::: JOGADA ", rodada, " :::::\n")
        escreva("VEJA SUAS CARTAS: ", jogador1menu, "\n")
        
        mostra_carta_para_jogadores(jogador1)
        escreva("QUAL VOCÊ DESEJA JOGAR: ")
        leia(jogada)
        verificar_erro(jogador1)
        encontra_pontuacao_da_carta(jogador1)
        verifica_jogada(jogador1, verdadeiro)

        // Jogador 2
        escreva("\n\nVEJA SUAS CARTAS: ", jogador2menu, "\n")
        
        mostra_carta_para_jogadores(jogador2)
        escreva("QUAL VOCÊ DESEJA JOGAR: ")
        leia(jogada)
        verificar_erro(jogador2)
        encontra_pontuacao_da_carta(jogador2)
        verifica_jogada(jogador2, falso)

        // Resultado da rodada
        vitoria_da_mao()
      }
      // Resultado final do jogo
      escreva("\n\n:::: RESULTADO FINAL :::::\n")
      escreva("Pontuação do Jogador 1: ", pontos_jogador1, "\n")
      escreva("Pontuação do Jogador 2: ", pontos_jogador2, "\n")
      se(pontos_jogador1 > pontos_jogador2) {
        escreva("VITÓRIA DA MÃO! JOGADOR 1")
        contador_vitoria_mao_jog_1++
      } senao se(pontos_jogador2 > pontos_jogador1) {
        escreva("VITÓRIA DA MÃO! JOGADOR 2")
        contador_vitoria_mao_jog_2++
      } senao {
        escreva("EMPATE FINAL")
      }
      placar_atual()
      reseta_cartas()
    }enquanto(contador_vitoria_mao_jog_1 < 3 e contador_vitoria_mao_jog_2 < 3) 
  
    escreva("\n\nJOGO FINALIZADO")
    }
  }
}