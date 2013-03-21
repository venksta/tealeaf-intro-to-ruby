=begin

Class.allocate is seldom used.
Class.alocatte is used when you want to .initialize.

x.is_a?(ClassName) returns true on whether the obj is an instance of the argument ClassName or not.

x.respond_to?(:times) <-- note the method is being called with a symbol. 
In ruby we don't care much about what type is the object. We care more about the methods it responds to.

You can't mixin Classes. You can mixin Modules.

OOP helps manage code complexity.

CLASS VARIABLES:
CLASS METHODS:
These pertain to the Class. Not the actual instances of the Class.

SINATRA is a very simple and lightweight web framework that allows us to build dynamic web applications. It has built-in routers and action controllers. It allows us to render views and see what's happening.

=end


class Dog

  PI = 3.14 # This is a constant.

  attr_accessor :name

  @@count = 0 # THIS IS AN CLASS VARIABLE. IT PERTAINS TO ALL INSTANCES OF THE CLASS

  def initialize(n)
    @name = n 
    @@count += 1 # WHENEVER A NEW DOG INSTANCE IS CREATED THIS COUNTER GOES UP.
  end

  def self.total # THIS IS A CLASS METHOD. Note the self prepend. Self is required to specifiy that it's a class method. We call class methods without creating an instance. We call them directly on a class. A class method is used when calling the method on a particular instance doesn't make sense as it pertains to all the instances. 
    @@count
  end

  def formal_name
    self.name = "Mr. " + name # Note: the first name is the setter. The second is the getter. When we acces the setter we need to prepend a self, because if we don't ruby will think you're just creating a new name local variable.

    # when you call the setter from within an instance method you prepend the self.

    # Don't confuse the self.method which is a class method with the self.variable inside an instance method. Totally different concepts.
  end

end

bob = Dog.new("bob")
puts bob.name

fred = Dog.new("fred")
puts fred.name

puts "Dogs, #{Dog.total}" # << here we call the Class method .total
puts Dog::PI # This is how you access a constant in a class.
