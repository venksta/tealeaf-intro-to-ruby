# Blackjack Game
# Author: Alberto De Lucca
# Object-Oriented exercise for Tealeaf's Academy Intro to Ruby course.
# A rewrite of:
# github.com/adeluccar/tealeaf-intro-to-ruby/blob/master/hw6_blackjack.rb

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
# class Purse
#   # attached to a player
#   # must be > 0 for player to be in game.
#   # can be replenished
# end

# class Bet
#   # inherit from Purse? A bet is a sub-purse attached to a player & hand.
#   # must be < purse to be valid (players cannot bet what they don't have)
#   # a bet belongs to a player
#   # a dealer doesn't bet
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
