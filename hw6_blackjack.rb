# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.
# The new deck builder was written by Eric Sauter https://github.com/esauter5
# 

def build(deck, suits, ranks)
  suits.each do |suit|
    ranks.each do |rank|
      card = {}
      card[:name] = "#{rank} of #{suit}"
      if rank == "Jack" || rank = "Queen" || rank = "King"
        card[:value] = 10
      elsif rank == "Ace"
        card[:value] = nil
      else
        card[:value] = rank.to_i
      end
      deck << card
    end
  end
end

def number_of_in_play(decks, deck, suits, ranks)
  deck = (decks).times { build(deck, suits, ranks) }
  deck
end

def shuffle(deck)
  deck.sort_by {rand}
end

def value(hand)
  sum = 0
  hand.each do |card|
    if card[:value].nil? == false
      sum += card[:value]
    end
  end
  hand.each do |card|
    if card[:value].nil? == true
      if sum <=10
        sum += 11
      else
        sum += 1
      end
    end
  end
  sum
end

def deal_card(deck, hand)
  hand << deck.pop # Thanks Eric Sauter
end

def want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)
  puts "Do you want to (p)lay again or (e)xit?"
  case gets.chomp.downcase
  when "p"
    reboot(player_hand, dealer_hand, play_deck, deck, player_name)
  when "e"
    exit
  else
    puts "Please input 'p' or 'e'."
    want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)
  end
end

def reboot(player_hand, dealer_hand, play_deck, deck, player_name)
  player_hand = []
  dealer_hand = []
  play_deck = []

  play_deck = shuffle(deck)

  deal_card play_deck, player_hand
  deal_card play_deck, player_hand

  puts
  puts "#{player_name.upcase}'S CARDS"
  print_hand(player_hand)
  p value player_hand
  puts

  puts "DEALER CARDS"
  deal_card play_deck, dealer_hand
  print_hand(dealer_hand)
  deal_card play_deck, dealer_hand
  puts

  player_hit_or_stay(play_deck, player_hand, dealer_hand, deck, player_name)
end

def player_hit_or_stay(play_deck, player_hand, dealer_hand, deck, player_name)
  puts "Would you like to (h)it or (s)tay?"
  case gets.chomp.downcase
  when 'h'
    deal_card(play_deck, player_hand)
    print_hand(player_hand)
    p value(player_hand)
    if value(player_hand) > 21
      puts "YOU BUSTED!"
      want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)
    else
      player_hit_or_stay(play_deck, player_hand, dealer_hand, deck, player_name)
    end
  when 's'
    puts "Now's the turn of the dealer."
    print_hand(dealer_hand)
    puts
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand, deck, player_name)
  else
    puts "Please input (h) or (s)."
    player_hit_or_stay(play_deck, player_hand, dealer_hand, deck, player_name)
  end
end

def dealer_hit_or_stay(value_dealer, value_player, play_deck, dealer_hand, player_hand, deck, player_name)
  if value_dealer > 21
    print_hand(dealer_hand)
    puts "DEALER BUSTED!"
    puts "YOU WIN!"
    want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)
  elsif value_dealer == 21 && value_player != 21
    print_hand(dealer_hand)
    puts "DEALER WINS!"
    want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)   
  elsif value_dealer == 21 && value_player == 21
    print_hand(dealer_hand)
    puts "YOU TIE WITH DEALER!"
    want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)   
  elsif value_dealer < value_player
    deal_card play_deck, dealer_hand
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand, deck, player_name)
  elsif value_dealer <= 17 # Thanks Matthew Breeden for this temporal fix.
    deal_card play_deck, dealer_hand
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand, deck, player_name)
  elsif value_dealer > value_player && value_dealer <= 21
    print_hand(dealer_hand)
    puts "DEALER WINS!"
    want_to_play_again(player_hand, dealer_hand, play_deck, deck, player_name)
  end
end

def print_hand(hand)
  hand.each {|card| puts "#{card[:name]}"}
end

suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
ranks = %w{2 3 4 5 6 7 8 9 10 Jack Queen King Ace}

puts "What is your name?"
player_name = gets.chomp
puts "How many decks would you like to play with?"
decks = gets.chomp.to_i

deck = []
card = {}
player_hand = []
dealer_hand = []
play_deck   = []

number_of_in_play(decks, deck, suits, ranks)
play_deck = shuffle(deck)

deal_card play_deck, player_hand
deal_card play_deck, player_hand

puts
puts "#{player_name.upcase}'S CARDS"
print_hand(player_hand)
p value player_hand
puts

puts "DEALER CARDS"
deal_card play_deck, dealer_hand
print_hand(dealer_hand)
deal_card play_deck, dealer_hand
puts

player_hit_or_stay(play_deck, player_hand, dealer_hand, deck, player_name)
