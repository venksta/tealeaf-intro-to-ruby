# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.

# puts "What is your name?"
# player_name = gets.chomp

player_hand  = []
dealer_hand  = []
deck         = (1..52).to_a

def shuffle
  self.sort_by { rand }
end

# returns how much the current hand is worth.
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

# deals a card and removes it from the deck
def deal_card(x)
  x.last
  x.pop
end

# maps every card to its suit and facial value
#Yeah. DRY be damned. LOL.
# aces = 1,14,27,40
# suits = 11,12,13,24,25,26,37,38,39,50,51,52
def cards(x)
  cards = []
  x.each do |card_number|

    case card_number
    when 1
      cards << "Ace of Spades"
    when 2
      cards << "2 of Spades"
    when 3
      cards << "3 of Spades"
    when 4
      cards << "4 of Spades"
    when 5
      cards << "5 of Spades"
    when 6
      cards << "6 of Spades"
    when 7
      cards << "7 of Spades"
    when 8
      cards << "8 of Spades"
    when 9
      cards << "9 of Spades"
    when 10
      cards << "10 of Spades"
    when 11
      cards << "Jack of Spades"
    when 12
      cards << "Queen of Spades"     
    when 13
      cards << "King of Spades"
    when 14
      cards << "Ace of Hearts"
    when 15
      cards << "2 of Hearts"
    when 16
      cards << "3 of Hearts"
    when 17
      cards << "4 of Hearts"
    when 18
      cards << "5 of Hearts"
    when 19
      cards << "6 of Hearts"
    when 20
      cards << "7 of Hearts"
    when 21
      cards << "8 of Hearts"
    when 22
      cards << "9 of Hearts"
    when 23
      cards << "10 of Hearts"
    when 24
      cards << "Jack of Hearts"
    when 25
      cards << "Queen of Hearts"
    when 26
      cards << "King of Hearts"
    when 27
      cards << "Ace of Diamonds"
    when 28
      cards << "2 of Diamonds"
    when 29
      cards << "3 of Diamonds"
    when 30
      cards << "4 of Diamonds"
    when 31
      cards << "5 of Diamonds"
    when 32
      cards << "6 of Diamonds"
    when 33
      cards << "7 of Diamonds"
    when 34
      cards << "8 of Diamonds"
    when 35
      cards << "9 of Diamonds"
    when 36
      cards << "10 of Diamonds"
    when 37
      cards << "Jack of Diamonds"
    when 38
      cards << "Queen of Diamonds"
    when 39
      cards << "King of Diamonds"
    when 40
      cards << "Ace of Clubs"
    when 41
      cards << "2 of Clubs"
    when 42
      cards << "3 of Clubs"
    when 43
      cards << "4 of Clubs"
    when 44
      cards << "5 of Clubs"
    when 45
      cards << "6 of Clubs"
    when 46
      cards << "7 of Clubs"
    when 47
      cards << "8 of Clubs"
    when 48
      cards << "9 of Clubs"
    when 49
      cards << "10 of Clubs"
    when 50
      cards << "Jack of Clubs"
    when 51
      cards << "Queen of Clubs"
    when 52
      cards << "King of Clubs"
    end
  end
  cards
end

def hit_or_stay
  puts "Would you like to 'h'it or 's'tay?"
  case gets.chomp.downcase
  when 'h'
    1
  when 's'
    2
  else
    puts "Please input 'h' or 's'."
    hit_or_stay
  end
end

play_deck = deck.shuffle

player_hand << deal_card(play_deck)
player_hand << deal_card(play_deck)

puts
puts "You are dealt: #{cards(player_hand)}."
puts "Your current sum is #{worth(player_hand)}"
puts

dealer_hand << deal_card(play_deck)
puts "Dealer reveals a #{cards(dealer_hand)}."
puts "The other card is hidden."
puts
dealer_hand << deal_card(play_deck)

# ask player whether "hit" or "stay"
# if "hit" deal card to player until player "stays" or "busts"
# if player stays and doesn't bust then
# dealer hits until his sum is higher than 17 and higher than the player.




# if player_choice == "h"
#   while player_choice == "h"
#     player_hand << deal_card(play_deck)
#     puts
#     puts cards(player_hand)
#     puts "Your current sum is #{worth(player_hand)}"
#       if worth(player_hand) > 21
#         puts "YOU BUSTED!"
#         puts "YOU LOSE!!!"
#         break
#         # would you like to play again?
#       end
#     puts "Would you like to 'h'it or 's'tay?"
#     player_choice = gets.chomp.downcase
#   end
# elsif player_choice == 's'

#   puts "I do get to checking out what happens at stay"

  # if worth(dealer_hand) == 21
  #   puts "Dealer reveals a Black Jack!"
  #   puts "YOU LOSE!"
  # else
  #   if worth(dealer_hand) < 17
  #     while worth(dealer_hand) <= 17
  #       dealer_hand << deal_card(play_deck)
  #       puts
  #       puts "Dealer cards are:"
  #       puts cards(dealer_hand)
  #     end
  #   elsif worth(dealer_hand) >= 17 && worth(dealer_hand) < worth(player_hand)
  #     while worth(dealer_hand) < worth(player_hand)
  #       dealer_hand << deal_card(play_deck)
  #       puts
  #       puts "Dealer cards are:"
  #       puts cards(dealer_hand)
  #     end
  #   elsif worth(dealer_hand) >= 17 && worth(dealer_hand) > worth(player_hand)
  #       puts
  #       puts "Dealer cards are:"
  #       puts cards(dealer_hand)
      
  #   end
    
  # end
  # while worth(dealer_hand) < 21
  # dealer_hand << deal_card(play_deck)
  # puts
  # puts "Dealer cards are:"
  # puts cards(dealer_hand)
  #   if worth(dealer_hand) == 21
  #     puts "DEALER WON! #{worth(dealer_hand)}"
  #     puts "YOU LOST!!!"
  #   end
  # end