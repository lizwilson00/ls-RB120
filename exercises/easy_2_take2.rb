# RB120
# Exercises
# Easy 2

=begin
# exercise 1
module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new 
bob = Employee.new
betty.print_address
bob.print_address

# exercise 2
module Drivable
  def drive
    puts "Driving"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# exercise 3
class House
  include Comparable
  
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# exercise 4
class Transform
  def initialize(input)
    @input = input
  end

  def uppercase
    @input.upcase
  end

  def self.lowercase(input_str)
    input_str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# exercise 5
class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

# exercise 6
class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# exercise 7
class Pet
  attr_reader :type, :pet_name

  def initialize(type, pet_name)
    @type = type
    @pet_name = pet_name
  end

  def to_s
    "a #{type} named #{pet_name}"
  end
end

class Owner
  attr_reader :name, :pets
  
  def initialize(owner_name)
    @name = owner_name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  def add_pet(pet)
    @pets << pet
  end
end

class Shelter
  def initialize
    @owners = {}
    @unadopted = []
  end
  
  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
    remove_from_unadopted(pet)
  end

  def print_adoptions
    @owners.each_pair do |own_name, owner|
      puts "#{own_name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts pet
      end
      puts ""
    end
  end

  def add_to_unadopted(pet)
    @unadopted << pet
  end

  def remove_from_unadopted(pet)
    @unadopted.delete(pet)
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    @unadopted.each do |pet|
      puts pet
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.add_to_unadopted(butterscotch)
shelter.add_to_unadopted(pudding)
shelter.add_to_unadopted(darwin)
shelter.add_to_unadopted(kennedy)
shelter.add_to_unadopted(sweetie)
shelter.add_to_unadopted(molly)
shelter.add_to_unadopted(chester)
shelter.add_to_unadopted(asta)
shelter.add_to_unadopted(laddie)
shelter.add_to_unadopted(fluffy)
shelter.add_to_unadopted(kat)
shelter.add_to_unadopted(ben)
shelter.add_to_unadopted(chatterbox)
shelter.add_to_unadopted(bluebell)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.print_unadopted
=end

# exercise 8 and 9
module Walkable
  def walk
    puts "#{full_name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end

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

class Noble < Person
  def full_name
    "#{@title} #{@name}"
  end
  
  def initialize(name, title)
    super(name)
    @title = title
  end

  private

  def gait
    "struts"
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