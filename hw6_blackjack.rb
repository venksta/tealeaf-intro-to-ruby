# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.

# puts "What is your name?"
# player_name = gets.chomp

def shuffle
  self.sort_by { rand }
end

def worth(x)
  sum = 0
  x.each do |x|
      if x == 2 || x == 15 || x == 28 || x == 41
        # worth 2
        sum += 2
      elsif x == 3 || x == 16 || x == 29 || x == 42
        sum += 3
      elsif x == 4 || x == 17 || x == 30 || x == 43
        sum += 4
      elsif x == 5 || x == 18 || x == 31 || x == 44
        sum += 5
      elsif x == 6 || x == 19 || x == 32 || x == 45
        sum += 6
      elsif x == 7 || x == 20 || x == 33 || x == 46
        sum += 7
      elsif x == 8 || x == 21 || x == 34 || x == 47
        sum += 8
      elsif x == 9 || x == 22 || x == 35 || x == 48
        sum += 9
      elsif x == 10 || x == 23 || x == 36 || x == 49
        sum += 10
      elsif x == 11 || x == 12 || x == 13 || x == 24 || x == 25 || x == 26 || x == 37 || x == 38 || x == 39 || x == 50 || x == 51 || x == 52 # Suits
        sum += 10
      end
  end
  x.each do |x|
    if x == 1 || x == 14 || x == 27 || x == 40 # Aces
      if sum <=10
        sum += 11
      else
        sum += 1
      end
    end
  end
  sum
end

def hit?
  puts "Your current sum is #{worth(player_hand)}"
  puts "Would you like to 'h'it or 's'tay?"
  if gets.chomps.downcase == "h"
    true
  elsif gets.chomp.downcase == "s"
    false
  else 
    puts "Please input 'h' or 's'."
  end
end

# TODO: want to add a method that deals one card at a time
# def deal_card
#   self.last
#   self.pop
# end

# aces = 1,14,27,40
# suits = 11,12,13,24,25,26,37,38,39,50,51,52

player_hand  = []
dealer_hand  = []
deck         = (1..52).to_a
deck_counter = 52

# shuffle deck

play_deck = deck.shuffle

# deal two cards to player

player_hand << play_deck.last
play_deck.pop
player_hand << play_deck.last
play_deck.pop

p player_hand
p worth(player_hand)

# deal two cards to dealer (one hidden)

dealer_hand << play_deck.last
play_deck.pop
dealer_hand << play_deck.last
play_deck.pop

p dealer_hand
p worth(dealer_hand)

# ask player whether "hit" or "stay"

# if "hit" deal card to player until player "stays" or "busts"

# if player stays and doesn't bust then

# dealer hits until his sum is higher than 17 and higher than the player.

# if dealer "busts" player wins.

# if dealer sum is higher than the player, then player loses.

# reshuffle deck and start again if player wishes to continue