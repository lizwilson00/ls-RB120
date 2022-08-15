# RB120
# Interview code examples
# Object Oriented Programming


# Objects and Classes
# Collaborator object
# class Person
#   attr_reader :name, :age
#   attr_accessor :friends, :pet
  
#   def initialize(name, age)
#     @name = name
#     @age = age
#     @friends = []
#   end

#   def change_name=(new_name)
#     self.name = new_name
#   end

#   private

#   attr_writer :name
# end

# class Pet
#   def initialize(name, type)
#     @name = name
#     @type = type
#   end

#   def sleep
#     "I'm sleeping"
#   end
# end


# bob = Person.new('Bob', 40)
# spot = Pet.new('Spot', 'dog')
# bob.pet = spot
# p bob.pet
# p bob.pet.sleep
# sarah = Person.new('Sarah', 41)
# bob.friends << sarah
# p bob.friends
# bob.name = 'Robert Smith'
# bob.change_name = 'Robert Smith'
# p bob.name



# Instance vs Class Methods
# class User
#   @@number_of_users = 0

#   def initialize(username, password)
#     @username = username
#     @password = password
#     @@number_of_users += 1
#   end

#   def change_password(new_password)
#     self.password = new_password
#   end

#   def self.number_of_users
#     @@number_of_users
#   end

#   private

#   attr_writer :password
# end

# p User.number_of_users
# bob = User.new('bob', 'abc123')
# # bob.change_password('123456')
# p User.number_of_users

# Modules
# module Swimmable
#   def swim
#     "Swimming!"
#   end
# end

# class Animal
#   def eat
#   end

#   def sleep
#   end
# end

# class Cat < Animal
#   def talk
#     "Meow!"
#   end
# end

# class Dog < Animal
#   include Swimmable
  
#   def talk
#     "Woof!"
#   end
# end

# class Fish < Animal
#   include Swimmable
# end

# p Fish.new.swim
# p Dog.new.swim
# p Cat.new.swim


# Getters and Setters
# Three ways

# class Person
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   # def name
#   #   @name
#   # end

#   # def name=(new_name)
#   #   @name = new_name
#   # end

#   def change_name(new_name)
#     self.name = new_name
#   end
# end

# liz = Person.new('Liz')
# p liz.name
# liz.change_name('Elizabeth')
# p liz.name

# why use getters and setters
# example of capitalizing the person's name
# class Person
#   attr_writer :name
  
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name.upcase
#   end

#   def greet
#     "Hello #{name}"
#   end

#   def Goodbye
#     "Goodbye #{name}"
# end

# bob = Person.new('bob')
# p bob.name
# p bob.greet

# Using self

# Why would you use inheritance and give an example
# using super
# class Animal
#   def initialize(name)
#     @name = name
#   end
  
#   def sleep
#   end

#   def eat
#     "The animal is eating"
#   end
# end

# class Cat < Animal
#   def initialize(name, breed)
#     super(name)
#     @breed = breed
#   end
  
#   def eat
#     "The cat is eating"
#   end

#   def talk
#     "Meow"
#   end
# end

# class Dog < Animal
# end

# Encapsulation / Method Access Control
# class Person
#   attr_accessor :name
#   attr_reader :balance

#   def initialize(name, balance)
#     @name = name
#     @balance = balance
#   end

#   def deposit(amount)
#     self.balance += amount
#   end

#   private

#   attr_writer :balance
# end

# bob = Person.new('Bob', 50)
# p bob.balance
# # p bob.balance = 100
# bob.deposit(25)
# p bob.balance

# Polymorphism


# Equivalence
# class Person
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end
# end

# person1 = Person.new('Person1')
# person2 = Person.new('Person1')
# # person2 = person1

# p person1 == person2
# p person1.object_id == person2.object_id

# str1 = "I'm a string"
# # str2 = str1
# str2 = "I'm a string"

# p str1 == str2 # checking whether the values are the same
# p str1.equal?(str2)
# p str1.eql?(str2)
# p str1.object_id == str2.object_id
# p str1 === str2
# p (str1 <=> str2) == 0

# Class Variables with Inheritance
# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# class Car < Vehicle
# end

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# p Motorcycle.wheels
# p Car.wheels
# p Vehicle.wheels

# keyword super

# fake operators
# ==
# test = 'test'
# test2 = 'test'
# p test == test2
# p test.object_id == test2.object_id

# class Person
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end
# end

# person1 = Person.new('bob')
# person2 = Person.new('bob')

# p person1 == person2
# p Person.ancestors

# constant
class Vehicle
  WHEELS = 4
  
  def initialize(make)
    @make = make
  end

  def wheels
    self.class::WHEELS
  end
end

class Car < Vehicle; end

class Tricycle < Vehicle
  WHEELS = 3
end

class Motorcycle < Vehicle
  WHEELS = 2

  # def wheels
  #   WHEELS
  # end
end

moto = Motorcycle.new('honda')
tri = Tricycle.new('vw')
car = Car.new('toyota')

p moto.wheels
p tri.wheels
p car.wheels

