programa {
  inclua biblioteca Util --> u
  inteiro carta_sorteada
  inteiro contador = 0
  cadeia jogador1[3]
  cadeia jogador2[3]

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

  funcao inicio() {
  
  //1º Sorteada

  entrega_tres_cartas(jogador1)
  escreva("\n")
  escreva(jogador1)
  entrega_tres_cartas(jogador2)
  escreva("\n")
  escreva(jogador2)
  
  }
  funcao cadeia entrega_tres_cartas(cadeia vetor[]){
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
}

