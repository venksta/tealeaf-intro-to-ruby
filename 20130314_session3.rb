# OOP APPROACH
# nouns map to classes
# verbs/behaviours map to methods
# state: instance variables track an object's state.

# modules are good for abstracting away common behaviours to different classes.

# How do I approach OO? build your classes. And start playing around with them by creating objects. If a behaviour is needed, then you know you can build a method in the class that supports that behaviour.

# all method should be inside classes

# manage app complexity by doing OO

# 1) attr_accesor

# HOW TO ABSTRACT COMMON FUNCTIONALITY TO CLASSES
# two ways of supporting shared behaviour

# 1) inheritance => subclassing i.e.
# only one superclass is allowed per derivedclass

# 2) composition => modules i.e. mixins
# we mix in modules
# in ruby module names tend to finish with "able" e.g. Swimmable
# That's because we're injecting behaviours in classes.
# modules need to be loaded before they're mixed in a class. be sure to add them on the top of your code.

module Swimmable
  def swim
    puts "I'm swimming!"
  end
end

class Animal
  def initialize(n)
    @name = n
  end

  def speak
    puts "#{@name} goes bwaaaaa"
  end
end

class Dog < Animal #dog inherits methods and attributes from Animal class
  attr_accessor :name
end

# getter: When we want to retrieve the state of an object. A getter on an instance variable

# setter: When we want to change/set the state of an object. A setter changes an instance variable.

# we don't want to acces instance variables directly. Best to use getter and setters for it.

class Cat < Animal
  attr_accessor :arch_nemesis, :name
  def initialize(n, dog)
    @name = n
    @arch_nemesis = dog
  end

  def my_enemy
    "#{name}'s arch nemesis is #{arch_nemesis.name}" #avoid the puts here. Have the method return a string and then in your game engine insert the puts or whatever you intend to do with the actual string.
  end

  # def my_method            #this is rare
  #   dog1 = Dog.new("joe")
  #   dog1.name
  # end

end

bob = Dog.new("bob")
bob.speak
puts bob.name
bob.name = "bob jones"
puts bob.name 

kitty = Cat.new('kitty', bob) # <= see that "bob" arg? it's referencing an actual object -the Dog.new("bob")- above. Since you have that object stored, you can execute it's own class methods. (Dog methods.)
# So bob will not respond to the Cat methods, but will to it's own. 
puts kitty.my_enemy
puts 

# engine - a 'conductor' where all the individual 'instruments' are coordinated

# class Game
#   def initialize
#     @player = Player.new
#     @dealer = Dealer.new
#   end

#   def start
#     #procedural style
#     deal_cards
#     did_player_win?
#     did_player_bust? #@player.bust?
#     did_dealer_win?
#     did_dealer_bust?
#     compare_hands
#   end
# end

# game = Game.new
# game.start