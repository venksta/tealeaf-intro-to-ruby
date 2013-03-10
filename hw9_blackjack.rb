# Blackjack Game
# Author: Alberto De Lucca
# Object-Oriented exercise for Tealeaf's Academy Intro to Ruby course.
# A rewrite of:
# github.com/adeluccar/tealeaf-intro-to-ruby/blob/master/hw6_blackjack.rb

class Card
  # must have one suit
  # must have one rank
  # must have a description string e.g. "Ace of Spades"
end

class Deck
  # if deck is recreated after every turn, then one deck suffices.
  # must have 52 cards.
  # cannot have duplicates.

  # POSSIBLE METHODS

  # build a deck of 52 cards
  # shuffle deck
  # deal_a_card from Deck to Hand
end

class Hand
  # inherit from Deck? true: A hand is a small deck attached to a player.
  # if hand value > 21 player loses

  ### POSSIBLE METHODS ###

  # compute value of hand
  # print a hand
  # split the hand
end

class Player
  # must have name
  # must have purse

  # can have multiple hands (after a split for example).
  # can "hit" (add a card to hand)
  # can "stand" (leave hand as is)
  # can "surrender" (take hand out of play and receive half of bet back)
  # can "double down" (double bet and receive ONLY one more card)
  # can "split" (split hand and play two hands. only if bet is matched)

  ### POSSIBLE METHODS ###

  # get name
  # get purse
  # want to play again?
  # want to rebuy chips?
  # place a bet
end

class Dealer
  # inherit from Player? true: A dealer is still a player.

  # cannot have multiple hands.
  # does not need name.
end

class Purse
  # attached to a player
  # must be > 0 for player to be in game.
  # can be replenished
end

class Bet
  # inherit from Purse? A bet is a sub-purse attached to a player & hand.
  # must be < purse to be valid (players cannot bet what they don't have)
end

class Round
  # one round includes a betting & playing turn of players & a turn of dealer.
end