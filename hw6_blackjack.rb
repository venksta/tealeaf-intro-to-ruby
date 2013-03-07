# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.
#
# -with input from-
# Matthew Breeden https://github.com/mattt-
# Eric Sauter https://github.com/esauter5

def build deck
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  ranks = %w{2 3 4 5 6 7 8 9 10 Jack Queen King Ace}
  suits.each do |suit|
    ranks.each do |rank|
      card = {}
      card[:name] = "#{rank} of #{suit}"
      if rank == "Jack" || rank == "Queen" || rank == "King"
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

def shuffle deck
  deck.sort_by {rand}
end

def value hand
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

def deal_card deck, hand
  hand << deck.pop
end

def print_hand hand
  hand.each {|card| puts "#{card[:name]}"}
end

def player_turn deck, player_hand, dealer_hand, player_name, bet, player_burse
  p player_burse
  print "Would you like to (H)it or (S)tay?> "
  case gets.chomp.downcase
  when 'h'
    deal_card deck, player_hand
    print_hand player_hand
    p value player_hand
    if value(player_hand) > 21
      puts "YOU BUSTED!\n"
      player_burse -= bet
      p player_burse
      print_burse player_burse
      want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
    else
      player_turn deck, player_hand, dealer_hand, player_name, bet, player_burse
    end
  when 's'
    dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name, bet, player_burse
  else
    puts "Please input (h) or (s)."
    player_turn deck, player_hand, dealer_hand, player_name, bet, player_burse
  end
end

def dealer_turn deck, value_dealer, value_player, player_hand, dealer_hand, player_name, bet, player_burse
    print_hand dealer_hand
  if value_dealer < 17
    deal_card deck, dealer_hand
    dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name, bet, player_burse
  else
    if value_dealer > value_player
      if value_dealer <= 21
        puts "DEALER WINS!"
        puts "YOU LOST #{bet} BITCOINS."
        player_burse -= bet
        print_burse player_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
      else
        puts "DEALER BUSTED!"
        puts "YOU WON #{bet*2} BITCOINS."
        player_burse = bet*2
        print_burse player_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
      end
    else
      if value_dealer == 21
        print_hand(dealer_hand)
        puts "YOU TIE WITH THE DEALER!"
        puts "YOUR BET OF #{bet} BITCOINS IS RETURNED."
        player_burse += bet
        print_burse player_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
      else
        deal_card deck, dealer_hand
        dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name, bet, player_burse
      end
    end
  end
end

def want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
  if player_burse == 0
    puts "YOU'VE GOT NO BITCOINS LEFT!."
    puts "SORRY! TIME TO LEAVE THE TABLE."
    exit
  end
  print "Do you want to (P)lay again or (E)xit?> "
  case gets.chomp.downcase
  when "p"
    reboot deck, player_hand, dealer_hand, player_name, bet, player_burse
  when "e"
    puts "THANKS FOR PLAYING!\n"
    exit
  else
    puts "Please input (p) or (e)."
    want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
  end
end

def place_a bet, player_burse
  print "How many BITCOINS do you want to bet? >"
  bet = gets.chomp.to_i

  if bet % 2 == 0
    if player_burse - bet < 0
      puts "SORRY! YOU DON'T HAVE ENOUGH MONEY TO MAKE THAT BET."
      place_a bet, player_burse 
    else
      puts "BET ACCEPTED!"
      player_burse -= bet
      bet
    end
  else
    puts "SORRY! ONLY EVEN NUMBERED BETS ACCEPTED."
    place_a bet, player_burse
  end
end

def print_burse player_burse
  puts "Your burse is #{player_burse} BITCOINS."
end

def reboot deck, player_hand, dealer_hand, player_name, bet, player_burse
  player_hand  = []
  dealer_hand  = []
  deck         = []
  player_burse = 100
  bet          = 0
  
  build deck
  deck = shuffle deck

  2.times { deal_card deck, player_hand }

  place_a bet, player_burse
  
  puts
  puts "#{player_name.upcase}'S CARDS"
  print_hand player_hand
  p value player_hand
  puts

  puts "DEALER CARDS"
  deal_card deck, dealer_hand
  print_hand dealer_hand
  puts "2ND CARD HIDDEN"
  deal_card deck, dealer_hand
  puts

  if (value dealer_hand) == 21
    puts "DEALER REVEALS BLACKJACK! YOU LOSE!\n"
    print dealer_hand
    player_burse -= bet
    print_burse player_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
  end
  
  if (value player_hand) == 21
    puts "BLACKJACK! YOU WIN!\n"
    player_burse += (bet * 1.50).to_i
    p player_burse
    print_burse player_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name, bet, player_burse
  end

  player_turn deck, player_hand, dealer_hand, player_name, bet, player_burse

end

deck         = []
player_hand  = []
dealer_hand  = []

system "clear"
puts "WELCOME TO BITCOIN BLACKJACK\n\n"

puts "What is your NAME?"
player_name = gets.chomp

reboot deck, player_hand, dealer_hand, player_name, bet, player_burse