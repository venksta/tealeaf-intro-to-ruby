# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.

# puts "What is your name?"
# player_name = gets.chomp

deck = [
# Spades
{:suit=>:spades, :face=>"A", :name=>"Ace of Spades", :value=>nil},
{:suit=>:spades, :face=>"2", :name=>"2 of Spades", :value=>2},
{:suit=>:spades, :face=>"3", :name=>"3 of Spades", :value=>3},
{:suit=>:spades, :face=>"4", :name=>"4 of Spades", :value=>4},
{:suit=>:spades, :face=>"5", :name=>"5 of Spades", :value=>5},
{:suit=>:spades, :face=>"6", :name=>"6 of Spades", :value=>6},
{:suit=>:spades, :face=>"7", :name=>"7 of Spades", :value=>7},
{:suit=>:spades, :face=>"8", :name=>"8 of Spades", :value=>8},
{:suit=>:spades, :face=>"9", :name=>"9 of Spades", :value=>9},
{:suit=>:spades, :face=>"10", :name=>"10 of Spades", :value=>10},
{:suit=>:spades, :face=>"J", :name=>"Jack of Spades", :value=>10},
{:suit=>:spades, :face=>"Q", :name=>"Queen of Spades", :value=>10},
{:suit=>:spades, :face=>"K", :name=>"King of Spades", :value=>10},
# Hearts
{:suit=>:hearts, :face=>"A", :name=>"Ace of Hearts", :value=>nil},
{:suit=>:hearts, :face=>"2", :name=>"2 of Hearts", :value=>2},
{:suit=>:hearts, :face=>"3", :name=>"3 of Hearts", :value=>3},
{:suit=>:hearts, :face=>"4", :name=>"4 of Hearts", :value=>4},
{:suit=>:hearts, :face=>"5", :name=>"5 of Hearts", :value=>5},
{:suit=>:hearts, :face=>"6", :name=>"6 of Hearts", :value=>6},
{:suit=>:hearts, :face=>"7", :name=>"7 of Hearts", :value=>7},
{:suit=>:hearts, :face=>"8", :name=>"8 of Hearts", :value=>8},
{:suit=>:hearts, :face=>"9", :name=>"9 of Hearts", :value=>9},
{:suit=>:hearts, :face=>"10", :name=>"10 of Hearts", :value=>10},
{:suit=>:hearts, :face=>"J", :name=>"Jack of Hearts", :value=>10},
{:suit=>:hearts, :face=>"Q", :name=>"Queen of Hearts", :value=>10},
{:suit=>:hearts, :face=>"K", :name=>"King of Hearts", :value=>10},
# Diamonds
{:suit=>:diamonds, :face=>"A", :name=>"Ace of Diamonds", :value=>nil},
{:suit=>:diamonds, :face=>"2", :name=>"2 of Diamonds", :value=>2},
{:suit=>:diamonds, :face=>"3", :name=>"3 of Diamonds", :value=>3},
{:suit=>:diamonds, :face=>"4", :name=>"4 of Diamonds", :value=>4},
{:suit=>:diamonds, :face=>"5", :name=>"5 of Diamonds", :value=>5},
{:suit=>:diamonds, :face=>"6", :name=>"6 of Diamonds", :value=>6},
{:suit=>:diamonds, :face=>"7", :name=>"7 of Diamonds", :value=>7},
{:suit=>:diamonds, :face=>"8", :name=>"8 of Diamonds", :value=>8},
{:suit=>:diamonds, :face=>"9", :name=>"9 of Diamonds", :value=>9},
{:suit=>:diamonds, :face=>"10", :name=>"10 of Diamonds", :value=>10},
{:suit=>:diamonds, :face=>"J", :name=>"Jack of Diamonds", :value=>10},
{:suit=>:diamonds, :face=>"Q", :name=>"Queen of Diamonds", :value=>10},
{:suit=>:diamonds, :face=>"K", :name=>"King of Diamonds", :value=>10},
# Clubs
{:suit=>:clubs, :face=>"A", :name=>"Ace of Clubs", :value=>nil},
{:suit=>:clubs, :face=>"2", :name=>"2 of Clubs", :value=>2},
{:suit=>:clubs, :face=>"3", :name=>"3 of Clubs", :value=>3},
{:suit=>:clubs, :face=>"4", :name=>"4 of Clubs", :value=>4},
{:suit=>:clubs, :face=>"5", :name=>"5 of Clubs", :value=>5},
{:suit=>:clubs, :face=>"6", :name=>"6 of Clubs", :value=>6},
{:suit=>:clubs, :face=>"7", :name=>"7 of Clubs", :value=>7},
{:suit=>:clubs, :face=>"8", :name=>"8 of Clubs", :value=>8},
{:suit=>:clubs, :face=>"9", :name=>"9 of Clubs", :value=>9},
{:suit=>:clubs, :face=>"10", :name=>"10 of Clubs", :value=>10},
{:suit=>:clubs, :face=>"J", :name=>"Jack of Clubs", :value=>10},
{:suit=>:clubs, :face=>"Q", :name=>"Queen of Clubs", :value=>10},
{:suit=>:clubs, :face=>"K", :name=>"King of Clubs", :value=>10},]

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
    if card[:face] == "A"
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
  hand << deck.last
  deck.pop
end

# checks if player wants to play again.
def want_to_play_again
  puts "JUST A TEST OF PLAY AGAIN METHOD"
end

#reboots all variables and starts the ball rolling again.
def reboot
end

#TODO
# Check whether player wants to hit or stay through input.
# If wrong input from player, then it should just call itself with an error message.
def player_hit_or_stay(play_deck, player_hand, dealer_hand)
  puts "Would you like to 'h'it or 's'tay?"
  case gets.chomp.downcase
  when 'h'
    deal_card(play_deck, player_hand)
    print_hand(player_hand)
    p value(player_hand)
    if value(player_hand) > 21
      puts "YOU BUSTED!"
      want_to_play_again
    else
      player_hit_or_stay(play_deck, player_hand, dealer_hand)
    end
  when 's'
    puts "Now's the turn of the dealer."
    print_hand(dealer_hand)
    puts
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand)
  else
    puts "Please input 'h' or 's'."
    player_hit_or_stay(play_deck, player_hand, dealer_hand)
  end
end

# Seems to work ok. Still keeping an eye out for this one.
def dealer_hit_or_stay(value_dealer, value_player, play_deck, dealer_hand, player_hand)

  if value_dealer > 21
    print_hand(dealer_hand)
    puts "DEALER BUSTED!"
    puts "YOU WIN!"
    want_to_play_again
  elsif value_dealer == 21 && value_player != 21
    print_hand(dealer_hand)
    puts "DEALER WINS!"
    want_to_play_again   
  elsif value_dealer == 21 && value_player == 21
    print_hand(dealer_hand)
    puts "YOU TIE WITH DEALER!"
    want_to_play_again   
  elsif value_dealer < 17
    deal_card play_deck, dealer_hand
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand)
  elsif value_dealer < value_player
    deal_card play_deck, dealer_hand
    dealer_hit_or_stay(value(dealer_hand), value(player_hand), play_deck, dealer_hand, player_hand)
  elsif value_dealer > value_player && value_dealer <= 21
    print_hand(dealer_hand)
    puts "DEALER WINS!"
    want_to_play_again
  end
end

def print_hand(hand)
  hand.each {|card| puts "#{card[:name]}"}
end

player_hand = []
dealer_hand = []
play_deck   = []

play_deck = shuffle(deck)

deal_card play_deck, player_hand
deal_card play_deck, player_hand

puts
puts "PLAYER CARDS"
print_hand(player_hand)
p value player_hand
puts

puts "DEALER CARDS"
deal_card play_deck, dealer_hand
print_hand(dealer_hand)
deal_card play_deck, dealer_hand
puts

p player_hit_or_stay(play_deck, player_hand, dealer_hand)





















##### OLD STUFF #### #### MAYBE SALVAGE PIECES OF CODE?

# def hit_or_stay
#   puts "Would you like to 'h'it or 's'tay?"
#   case gets.chomp.downcase
#   when 'h'
#     1
#   when 's'
#     2
#   else
#     puts "Please input 'h' or 's'."
#     hit_or_stay
#   end
# end

# play_deck = deck.shuffle

# player_hand << deal_card(play_deck)
# player_hand << deal_card(play_deck)

# puts
# puts "You are dealt: #{cards(player_hand)}."
# puts "Your current sum is #{worth(player_hand)}"
# puts

# dealer_hand << deal_card(play_deck)
# puts "Dealer reveals a #{cards(dealer_hand)}."
# puts "The other card is hidden."
# puts
# dealer_hand << deal_card(play_deck)

# ask player whether "hit" or "stay"
# if "hit" deal card to player until player "stays" or "busts"
# if player stays and doesn't bust then
# dealer hits until his sum is higher than 17 and higher than the player.



