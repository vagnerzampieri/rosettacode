# frozen_string_literal: true

# Represent a deck of cards that is shuffled and dealt out to two players,
# then repeatedly “play rounds” where each player draws a card from the top of their deck,
# and whoever’s is higher takes both cards and puts them on the bottom of their deck,
# Repeat this until one player has all the cards and is the winner.

# Bonus: If the drawn cards are equal, 4 cards are then drawn and compared at once,
# with the winner of the most matches taking all cards

# Represente um baralho de cartas que é embaralhado e distribuído para dois jogadores,
# então repetidamente “jogar rodadas” onde cada jogador tira uma carta do topo de seu baralho,
# e quem for maior leva as duas cartas e as coloca no fundo de seu baralho,
# Repita isso até que um jogador tenha todas as cartas e seja o vencedor.

# Bônus: se as cartas sorteadas forem iguais, 4 cartas são sorteadas e comparadas de uma vez,
# com o vencedor das partidas mais partidas levando todas as cartas (se der empate é sorteio )

# 1. Crie um array com todas as cartas do baralho
# 2. Embaralhe as cartas
# 3. Distribua as cartas para os jogadores
# 4. Crie um loop para que os jogadores joguem até que um deles tenha todas as cartas
# 5. Crie um loop para que os jogadores joguem até que um deles tenha todas as cartas
# 6. Crie um loop para que os jogadores joguem até que um deles tenha todas as cartas

suits = %w[♠ ♥ ♦ ♣]
ranks = %w[2 3 4 5 6 7 8 9 10 J Q K A]
cards = {}
player1 = []
player2 = []

suits.each do |suit|
  ranks.each.with_index do |rank, i|
    cards["#{suit}-#{rank}"] = i
  end
end

cards_shuffled = cards.keys.shuffle

change_player = true
cards_shuffled.each do |card|
  if change_player
    change_player = false
    player1 << card
  else
    change_player = true
    player2 << card
  end
end

count = 0

while player1 || player2
  break if player1.empty? || player2.empty?

  player1_pop = player1.pop
  player2_pop = player2.pop

  player = if cards[player1_pop] == cards[player2_pop]
             [player1, player2].sample
           elsif cards[player1_pop] > cards[player2_pop]
             player1
           else
             player2
           end

  player.append(player1_pop)
  player.append(player2_pop)
  count += 1
end

puts "player1 #{player1}"
puts "player2 #{player2}"
p "count #{count}"
