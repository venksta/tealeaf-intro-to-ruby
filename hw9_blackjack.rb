# Blackjack Game
# Author: Alberto De Lucca
# Object-Oriented exercise for Tealeaf's Academy Intro to Ruby course.
# A rewrite of:
# github.com/adeluccar/tealeaf-intro-to-ruby/blob/master/hw6_blackjack.rb

BLACKJACK_WIN_MULTIPLE = 1.5
PLAYER_WIN_MULTIPLE    = 2
MAX_PLAYERS_ALLOWED    = 3

class Card

  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def card_description
    long_rank = case rank
                when "A" then "Ace"
                when "J" then "Jack"
                when "Q" then "Queen"
                when "K" then "King"
                else rank
                end

    long_suit = case suit
                when "H" then "Hearts"
                when "S" then "Spades"
                when "C" then "Clubs"
                when "D" then "Diamonds"
                end

    "#{long_rank} of #{long_suit}"
  end

  def to_s
    card_description
  end
end

class Deck

  attr_reader :deck

  def initialize
    @deck = []
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits = ['H', 'D', 'S', 'C']
    ranks.each do |rank|
      suits.each do |suit|
        @deck << Card.new(rank, suit)    
      end
    end
    deck.shuffle!
  end

  def deal_card
    deck.pop
  end
end

class Player

  attr_accessor :name, :purse, :bet
  @@number_of_players = 0

  def initialize(name, starting_purse)
    @name = name
    @purse = Purse.new(starting_purse)
    @@number_of_players += 1
  end

  def how_many_playing
    "#{@@number_of_players} #{@@number_of_players == 1 ? 'player' : 'players'} in play"
  end

  def hit?
    print "Do you want to (h)it or (s)tay?> "
    case gets.chomp.downcase
    when 'h'
      true
    when 's'
      false
    else
      puts "Please input (h) or (s)."
      self.hit?
    end
  end

  def double_down?
    print "Would you like to double down? y/n> "
    case gets.chomp.downcase
    when 'y'
      true
    when 'n'
      false
    else
      puts "Please input (y) or (n)."
      self.double_down?
    end
  end

  def surrender?
    print "Would you like to surrender your turn? y/n> "
    case gets.chomp.downcase
    when 'y'
      true
    when 'n'
      false
    else
      puts "Please input (y) or (n)."
      self.surrender?
    end
    
  end

  def play_again?
    print "Do you want to (p)lay again or (e)xit?> "
    case gets.chomp.downcase
    when "p"
      true
    when "e"
      false
    else
      puts "Please input (p) or (e)."
      self.play_again?
    end
  end
end

class Purse
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def no_money?
    amount <= 0 ? true : false
  end

  # def to_s
  #   amount
  # end

  def deduct(bet)
    amount -= bet
  end

  # add to purse
  # purse plus winning bet
end


player = Player.new('Alberto', 0)
p player.purse.no_money?


class Game

  attr_accessor :players, :purses, :rounds, :bets, :hands, :dealer

  def initialize
    @players = []
  end

  # welcome message
  def welcome_message
    system "clear"
    puts "WELCOME TO BITCOIN BLACKJACK!"
    puts "\n\nRULES"
    puts "Dealer Blackjack wins."
    puts "Dealer hand under 17 will always hit."
    puts "\nBet wisely.\n\n"
  end

  def how_many_players
    puts "Up till #{MAX_PLAYERS_ALLOWED} can play)"
    print "How many players want to play?> "
    choice = gets.chomp
    if choice.to_i != 0
      choice.to_i
    else
      puts "Please input a number between 1 and #{MAX_PLAYERS_ALLOWED}."
      self.how_many_players
   end
  end

  # instantiate players (with purses)
  def create_players
    how_many_players.times do |x|
      print "Player #{x + 1}, what's your name?> "
      name = gets.chomp.capitalize
      print "#{name}, how much money would you like to start with?> "
      purse = gets.chomp.to_i
      if purse > 0
        purse
      else
        puts "Please enter the number of chips you want."
        self
      end
      players << Player.new(name, purse)
    end
    p players
  end



  # start a round
  #   build deck
  #   ask for player bet
  #   deduct bet from player purse
  #   deal hands
  #   print player hand
  #   print dealer hand (one card hidden)
  #     loop player hit?
  #           deal card
  #   print dealer hand (complete)
  #     loop dealer hit?
  #           deal card
  #   compare hands (determine winner)
  #   show winning or losing message
  #   add winnings to player purse
  #   play again?
  #     loop start a round
  #   exit game

end
game = Game.new
game.create_players

# class Bet

#   attr_accessor :bet

#   def initialize(bet_quantity)
#     @bet = bet_quantity
#   end

#   def valid?(purse)
#     bet <= purse.amount ? true : false
#   end

#   def double
#     bet *= 2
#   end
# end

# class Hand

#   attr_accessor :hand

#   def initialize
#     @hand = []
#   end

#   def is_busted?
#     value > 21
#   end

#   # def show_hand
#   #   hand.each {|card| puts card.long_description}
#   # end
#   # inherit from Deck? true: A hand is a small deck attached to a player.
#   # if hand value > 21 player loses

#   # a hand belongs to a player or dealer

#   ### POSSIBLE METHODS ###

#   # compute value of hand
#   # print a hand
#   # split the hand
# end

# class Player
#   # must have name
#   # must have purse
#   # must bet in order to play a hand

#   # can have multiple hands (after a split for example).
#   # can "hit" (add a card to hand)
#   # can "stand" (leave hand as is)
#   # can "surrender" (take hand out of play and receive half of bet back)
#   # can "double down" (double bet and receive ONLY one more card)
#   # can "split" (split hand and play two hands. only if bet is matched)

#   ### POSSIBLE METHODS ###

#   # get name
#   # get purse
#   # want to rebuy chips?
#   # place a bet
# end

# class Dealer
#   # inherit from Player? true: A dealer is still a player.

#   # cannot have multiple hands.
#   # does not need name.
#   # can log bets won
# end


# class Round
#   # one round includes a betting & playing turn of players & a turn of dealer.

#   # round starts
#   # a deck is created
#   # one card is dealt and shown to every player
#   # one card is dealt to the dealer but not shown
#   # one card is dealt and shown to every player
#   # one card is dealt and shown to the dealer
#   # each player hits, stays, splits, surrenders or doubles down
#   # each hand value is computed until player either stays or busts
#   # if player busts, he's out of the round
#   # when all players end their plays, dealer reveals hidden card
#   # if dealer's vale is < 17 dealer hits
#   # if dealer's value is >= 17 dealer stays
#   # if player's value is > dealer player wins
#   # if player's value is < dealer player loses
#   # if player's value == dealer's they tie
#   # round ends
# end

# class Game
  
# end
