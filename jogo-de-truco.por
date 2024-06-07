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

funcao inicio() {
  escreva("::::::::: MENU :::::::::\n")
  escreva("olá\n","seja bem vindo ao nosso jogo\n", "deseja iniciar o jogo?\n")
  leia(opcao)

  se(opcao == "sim" ou opcao=="s"){
    escreva("digite o primeiro jogador\n")
    leia(jogador1menu)
    escreva("digite o segundo jogador\n")
    leia(jogador2menu)

    escreva("\n\n jogador 1:\n\n", jogador1menu, "\n\njogador 2:\n\n", jogador2menu, "\n")
    entrega_tres_cartas(jogador1)
    entrega_tres_cartas(jogador2)
    

    para(inteiro rodada = 1; rodada <= 3; rodada++) {
      escreva("\n\n:::: RODADA ", rodada, " :::::\n")

      // Jogador 1
      escreva("VEJA SUAS CARTAS: JOGADOR 1\n","\n JOGADOR 1:\n", jogador1menu, "\n")
      
      mostra_carta_para_jogadores(jogador1)
      escreva("QUAL VOCÊ DESEJA JOGAR: ")
      leia(jogada)
      encontra_pontuacao_da_carta(jogador1)
      verifica_jogada_1(jogador1)

      // Jogador 2
      escreva("\n\nVEJA SUAS CARTAS: JOGADOR 2\n","\n JOGADOR 2:\n", jogador2menu, "\n")
      
      mostra_carta_para_jogadores(jogador2)
      escreva("QUAL VOCÊ DESEJA JOGAR: ")
      leia(jogada)
      encontra_pontuacao_da_carta(jogador2)
      verifica_jogada_2(jogador2)

      // Resultado da rodada
      vitoria_da_mao()
    }

    // Resultado final do jogo
    escreva("\n\n:::: RESULTADO FINAL :::::\n")
    escreva("Pontuação do Jogador 1: ", pontos_jogador1, "\n")
    escreva("Pontuação do Jogador 2: ", pontos_jogador2, "\n")
    se(pontos_jogador1 > pontos_jogador2) {
      escreva("VITÓRIA FINAL! JOGADOR 1")
    } senao se(pontos_jogador2 > pontos_jogador1) {
      escreva("VITÓRIA FINAL! JOGADOR 2")
    } senao {
      escreva("EMPATE FINAL")
    }

  } senao {
    escreva("jogo finalizado")
    leia(jogofinalizado)
  }
}

funcao cadeia entrega_tres_cartas(cadeia vetor[]){
  inteiro carta_sorteada
  para(contador = 0; contador < 3; contador++){
    carta_sorteada = u.sorteia(0, 39)
    se(uso_da_carta[carta_sorteada] == verdadeiro){
      contador-- // Se a carta já foi usada, decrementar o contador para sortear outra
    } senao {
      vetor[contador] = nome_de_cartas[carta_sorteada]
      uso_da_carta[carta_sorteada] = verdadeiro
    }
  }
  retorne vetor
}

funcao reseta_cartas(){
  para(inteiro i = 0; i < 40; i++){
    uso_da_carta[i] = falso
  }
}

funcao vitoria_da_mao(){
  se(carta_escolhida_1 > carta_escolhida_2){
    escreva("\n\nVITÓRIA DA RODADA! JOGADOR 1")
    pontos_jogador1++
  }
  senao se(carta_escolhida_2 > carta_escolhida_1){
    escreva("\n\nVITÓRIA DA RODADA! JOGADOR 2")
    pontos_jogador2++
  }
  senao{
    escreva("\n\nEMPATE NA RODADA")
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

funcao verifica_jogada_1(cadeia jogador[]){
  se(jogada == 1){
    escreva(jogador[0], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
    jogador[0] = " "
  }
  se(jogada == 2){
    escreva(jogador[1], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
    jogador[1] = " "
  }
  se(jogada == 3){
    escreva(jogador[2], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_1 = pontuacao_das_cartas[acha_posicao]
    jogador[2] = " "
  }
}

funcao verifica_jogada_2(cadeia jogador[]){
  se(jogada == 1){
    escreva(jogador[0], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
    jogador[0] = " "
  }
  se(jogada == 2){
    escreva(jogador[1], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
    jogador[1] = " "
  }
  se(jogada == 3){
    escreva(jogador[2], " --> ", pontuacao_das_cartas[acha_posicao], " PONTOS")
    carta_escolhida_2 = pontuacao_das_cartas[acha_posicao]
    jogador[2] = " "
  }
}
    
  }

