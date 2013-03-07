# Blackjack Game
# Author: Alberto De Lucca
# Exercise for Tealeaf Academy.
#
# -with input from-
# Matthew Breeden https://github.com/mattt-
# Eric Sauter https://github.com/esauter5

def build(deck)
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
  hand << deck.pop
end

def print_hand(hand)
  hand.each {|card| puts "#{card[:name]}"}
end

def player_turn(deck, player_hand, dealer_hand, player_name)
  print "Do you want to (h)it or (s)tay?> "
  case gets.chomp.downcase
  when 'h'
    deal_card deck, player_hand
    print_hand player_hand
    p value player_hand
    if value(player_hand) > 21
      puts "You busted!\n"
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

def dealer_turn(deck, value_dealer, value_player, player_hand, dealer_hand, player_name)
    print_hand dealer_hand
    puts

  if value_dealer < 17
    deal_card deck, dealer_hand
    dealer_turn(deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name)
  else
    if value_dealer > value_player
      if value_dealer <= 21
        puts "Dealer wins!"
        p value dealer_hand
        puts "You lost #{$bet} #{$bet == 1 ? "bitcoin" : "bitcoins"}."
        print_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name
      else
        puts "Dealer busted!"
        p value dealer_hand
        puts "You won #{$bet*2} #{$bet == 1 ? "bitcoin" : "bitcoins"}."
        $player_burse += $bet*2
        print_burse
        want_to_play_again deck, player_hand, dealer_hand, player_name
      end
    else
      if value_dealer == 21
        p value dealer_hand
        puts "You tie with the dealer!"
        puts "#{$bet/2} #{$bet == 1 ? "bitcoin" : "bitcoins"} is returned to your burse."
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

def want_to_play_again(deck, player_hand, dealer_hand, player_name)
  if $player_burse == 0
    exit_message
  end
  print "Do you want to (p)lay again or (e)xit?> "
  case gets.chomp.downcase
  when "p"
    reboot deck, player_hand, dealer_hand, player_name
  when "e"
    exit_message
  else
    puts "Please input (p) or (e)."
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end
end

def buy_bitcoins
  print "How many bitcoins will you buy from the dealer?> "
  $player_burse = gets.chomp.to_i
  if $player_burse.class == Fixnum
    $player_burse
  else
    puts "Please enter the number of bitcoins you want."
    buy_bitcoins
  end
end

def place_a
  print "\nHow many bitcoins do you want to bet?> "
  $bet = gets.chomp.to_i

  if $bet.class == Fixnum
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
    puts "SORRY! Only numbered bets are allowed."
    place_a
  end
end

def print_burse
  puts "Your burse is #{$player_burse} #{$player_burse == 1 ? "bitcoin" : "bitcoins"}."
end

def exit_message
  if $player_burse != 0
    puts "\nHope you had a great time playing!"
    puts "Any suggestions for improvements?\n\n"
    puts "If these were real bitcoins,"
    puts "you would've walked with roughly #{$player_burse*35} USD!"
    puts "Have you considered buying bitcoins?\n\n"
    exit    
  else
    puts "\nYou've got no bitcoins left!"
    puts "A security guard escorts you out of the table.\n"
    puts "You vow to complain to management."
    puts "Instead, you manage to get blacklisted.\n"
    puts
    puts "P.S: You should buy some bitcoins. For real.\n\n"
    exit    
  end

end

def surrender_turn?
  print "Would you like to surrender your turn? y/n> "
  case gets.chomp.downcase
  when 'y'
    puts "You surrender."
    puts "You get back #{$bet/2} bitcoins."
    $player_burse += ($bet/2)
    return true
  when 'n'
    return false
  else
    puts "Please input (y) or (n)."
    surrender_turn?
  end
end

def double_down?
  print "Would you like to double down? y/n> "
  case gets.chomp.downcase
  when 'y'
    puts "You double down your bet!"
    puts "You will only get one additional card."
    puts "Good luck!"
    $player_burse -= ($bet)
    return true
  when 'n'
    return false
  else
    puts "Please input (y) or (n)."
    double_down?
  end
end

def reboot(deck, player_hand, dealer_hand, player_name)
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
    print_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end
  
  if (value player_hand) == 21
    puts "BLACKJACK! You win #{($bet * 1.50).to_i} bitcoins!"
    $player_burse += ($bet * 1.50).to_i
    print_burse
    want_to_play_again deck, player_hand, dealer_hand, player_name
  end
  
  if $player_burse >= $bet
    double_down_flag = double_down?
    if double_down_flag == true
    deal_card deck, player_hand
    print_hand player_hand
    p value player_hand
    puts
    dealer_turn(deck, value(dealer_hand), value(player_hand), player_hand, dealer_hand, player_name)
    end
  end

  surrender_flag = surrender_turn?
  if surrender_flag == true
    want_to_play_again deck, player_hand, dealer_hand, player_name
  else
    player_turn deck, player_hand, dealer_hand, player_name
  end

  player_turn deck, player_hand, dealer_hand, player_name

end

deck          = []
player_hand   = []
dealer_hand   = []
$player_burse = 0
$bet          = 0

system "clear"
puts "WELCOME TO BITCOIN BLACKJACK!"
puts "\n\nRULES"
puts "Dealer Blackjack wins."
puts "Dealer hand under 17 will always hit."
puts "\nBet wisely.\n\n"

print "What is your name?> "
player_name = gets.chomp

buy_bitcoins
reboot deck, player_hand, dealer_hand, player_name

