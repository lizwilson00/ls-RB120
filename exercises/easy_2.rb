# RB120
# Exercises
# easy_2.rb

# exercise 1
# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end



# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee < Customer
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

# exercise 2
# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# exercise 3
# class House
#   include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# exercise 4
# class Transform
#   def initialize(word)
#     @word = word
#   end

#   def self.lowercase(new_word)
#     new_word.downcase
#   end

#   def uppercase
#     @word.upcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# exercise 5
# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

# exercise 6
# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# exercise 7
# class Owner
#   attr_accessor :pets
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets
#     pets.count
#   end
# end

# class Shelter
#   attr_accessor :adoptions, :avail_pets
  
#   def initialize
#     @adoptions = {}
#     @avail_pets = []
#   end

#   def adopt(owner, pet)
#     owner.pets << pet
#     adoptions[owner] ? adoptions[owner] << pet : adoptions[owner] = [pet]
#     remove_avail_pet(pet)
#   end
  
#   def print_adoptions
#     adoptions.each do |owner, adopted_pets|  
#       puts "#{owner.name} has adopted the following pets:"
#       adopted_pets.each{ |pet| puts pet }
#       puts ""
#     end
#   end

#   def add_avail_pet(pet)
#     avail_pets << pet
#   end

#   def remove_avail_pet(pet)
#     avail_pets.delete(pet) 
#   end

#   def num_avail_pets
#     avail_pets.size
#   end

#   def print_avail_pets
#     puts "The Animal Shelter has the following unadopted pets:"
#     avail_pets.each{ |pet| puts pet }
#   end
# end

# class Pet
#   attr_reader :type, :name
  
#   def initialize(type, name)
#     @type = type
#     @name = name
#   end

#   def to_s
#     "a #{type} named #{name}"
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
# asta         = Pet.new('dog', 'Asta')
# laddie       = Pet.new('dog', 'Laddie')
# fluffy       = Pet.new('cat', 'Fluffy')
# kat          = Pet.new('cat', 'Kat')
# ben          = Pet.new('cat', 'Ben')
# chatterbox   = Pet.new('parakeet', 'Chatterbox')
# bluebell     = Pet.new('parakeet', 'Bluebell')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.add_avail_pet(butterscotch)
# shelter.add_avail_pet(pudding)
# shelter.add_avail_pet(darwin)
# shelter.add_avail_pet(kennedy)
# shelter.add_avail_pet(sweetie)
# shelter.add_avail_pet(molly)
# shelter.add_avail_pet(chester)
# shelter.add_avail_pet(asta)
# shelter.add_avail_pet(laddie)
# shelter.add_avail_pet(fluffy)
# shelter.add_avail_pet(kat)
# shelter.add_avail_pet(ben)
# shelter.add_avail_pet(chatterbox)
# shelter.add_avail_pet(bluebell)
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# shelter.print_avail_pets
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# puts "The Animal Shelter has #{shelter.num_avail_pets} unadopted pets."

# # P Hanson has adopted the following pets:
# # a cat named Butterscotch
# # a cat named Pudding
# # a bearded dragon named Darwin

# # B Holmes has adopted the following pets:
# # a dog named Molly
# # a parakeet named Sweetie Pie
# # a dog named Kennedy
# # a fish named Chester

# # P Hanson has 3 adopted pets.
# # B Holmes has 4 adopted pets.

# exercise 8
# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander

# exercise 9 and 10
module Walkable
  def walk
    puts "#{full_name} #{gait} forward."
  end
end

class Animal
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :name, :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def full_name
    title + name
  end

  private

  def gait
    "struts"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

p byron.name
# => "Byron"
p byron.title
# => "Lord"