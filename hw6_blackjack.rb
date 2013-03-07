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

def player_turn deck, player_hand, dealer_hand, player_name
  print "Would you like to (h)it or (s)tay?> "
  case gets.chomp.downcase
  when 'h'
    deal_card deck, player_hand
    print_hand player_hand
    p value player_hand
    if value(player_hand) > 21
      puts "You busted!\n"
      $player_burse -= $bet
      print_burse
      want_to_play_again deck, player_hand, dealer_hand, player_name
    else
      player_turn deck, player_hand, dealer_hand, player_name
    end
  when 's'
    dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name
  else
    puts "Please input (h) or (s)."
    player_turn deck, player_hand, dealer_hand, player_name
  end
end

def dealer_turn deck, value_dealer, value_player, player_hand, dealer_hand, player_name
    print_hand dealer_hand
    puts

  if value_dealer < 17
    deal_card deck, dealer_hand
    dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name
  else
    if value_dealer > value_player
      if value_dealer <= 21
        puts "Dealer wins!"
        p value dealer_hand
        puts "You lost #{$bet} bitcoins."
        print_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name
      else
        puts "Dealer busted!"
        p value dealer_hand
        puts "You won #{$bet*2} bitcoins."
        $player_burse += $bet*2
        print_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name
      end
    else
      if value_dealer == 21
        p value dealer_hand
        puts "You tie with the dealer!"
        puts "Your bet of #{$bet} bitcoins is returned to your burse."
        $player_burse += $bet
        print_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name
      else
        deal_card deck, dealer_hand
        dealer_turn deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name
      end
    end
  end
end

def want_to_play_again deck, player_hand, dealer_hand, player_name
  if $player_burse == 0
    puts "\nYou've got no bitcoins left!"
    puts "A security guard escorts you out of the table.\n"
    puts "You vow to complain to management."
    puts "Instead, you get blacklisted.\n\n"
    exit
  end
  print "Do you want to (P)lay again or (E)xit?> "
  case gets.chomp.downcase
  when "p"
    reboot deck, player_hand, dealer_hand, player_name
  when "e"
    puts "Thanks for playing!"
    puts "You did great!"
    exit
  else
    puts "Please input (p) or (e)."
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end
end

def place_a
  print "\nHow many bitcoins do you want to bet?> "
  $bet = gets.chomp.to_i

  if $bet % 2 == 0
    if $player_burse - $bet < 0
      puts "Sorry! You don't have enough money to make that bet."
      puts "Please bet #{$player_burse} bitcoins or lower."
      place_a 
    else
      puts "Bet accepted!"
      $player_burse -= $bet
      print_burse
    end
  else
    puts "SORRY! Only even numbered bets are allowed."
    place_a
  end
end

def print_burse
  puts "Your burse is #{$player_burse} bitcoins."
end

def reboot deck, player_hand, dealer_hand, player_name
  player_hand  = []
  dealer_hand  = []
  deck         = []
  
  build deck
  deck = shuffle deck

  2.times { deal_card deck, player_hand }

  print_burse
  place_a
  
  puts
  puts "#{player_name.capitalize}'s cards"
  print_hand player_hand
  p value player_hand
  puts

  puts "Dealer cards"
  deal_card deck, dealer_hand
  print_hand dealer_hand
  puts "2nd card hidden"
  deal_card deck, dealer_hand
  puts

  if (value dealer_hand) == 21
    puts "Dealer reveals blackjack! You lose!\n"
    print_hand dealer_hand
    $player_burse -= $bet
    print_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end
  
  if (value player_hand) == 21
    puts "BLACKJACK! You win #{($bet * 1.50).to_i} bitcoins!"
    $player_burse += ($bet * 1.50).to_i
    print_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end

  player_turn deck, player_hand, dealer_hand, player_name

end

deck          = []
player_hand   = []
dealer_hand   = []
$player_burse = 100
$bet          = 0

system "clear"
puts "WELCOME TO BITCOIN BLACKJACK!\n\n"
puts "You're starting with 100 bitcoins."
puts "Bet wisely."
puts "\nRULES"
puts "No double-down, split or surrender."
puts "Dealer Blackjack wins."
puts "Dealer hand under 17 will always hit."

print "\nWHAT IS YOUR NAME?> ".capitalize
player_name = gets.chomp

reboot deck, player_hand, dealer_hand, player_name