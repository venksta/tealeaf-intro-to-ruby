# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.

# puts "What is your name?"
# player_name = gets.chomp

def shuffle
  self.sort_by { rand }
end

def hit?
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

player_cards = []
dealer_cards = []
deck = (1..52).to_a
deck_counter = 52
stay = nil

# shuffle deck

play_deck = deck.shuffle

# deal two cards to player

player_cards << play_deck.last
play_deck.pop
player_cards << play_deck.last
play_deck.pop
p player_cards
p play_deck.length


# deal two cards to dealer (one hidden)
# ask player whether "hit" or "stay"
# if "hit" deal card to player until player "stays" or "busts"
# if player stays and doesn't bust then
# dealer hits until his sum is higher than 17 and higher than the player.
# if dealer "busts" player wins.
# if dealer sum is higher than the player, then player loses.
# reshuffle deck and start again if player wishes to continue