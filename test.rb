# RB120
# test.rb
# Codeacademy

=begin
class Account
  attr_reader :name, :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    puts pin_number == pin ? "Balance $#{@balance}" : pin_error
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      if amount > @balance
        puts overdraw_error 
      else
        @balance -= amount
        puts "Withdrew $#{amount}.  New balance: $#{@balance}."
      end
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited $#{amount}.  New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def overdraw_error
    "That withdrawal amount is over the available balance in your account. 
    Please enter a smaller withdrawal amount."
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end

checking_account = Account.new("lizs_checking", 25_000)
checking_account.withdraw(1234, 5_000)

class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new

puts whiskers == ginger
puts whiskers.object_id
puts ginger.object_id

class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

puts SomethingElse.ancestors

module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
# pingu.fly

puts Penguin.ancestors

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

class Person
  attr_writer :first_name, :last_name

  def full_name
    # omitted code
    "#{first_name} #{last_name}"
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
puts mike.full_name # => 'Michael Garcia'

class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade # => "A"

class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

kate = Person.new
kate.name = 'Kate'
p kate.name # => 'Kate'

# lesson 2
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    split_name = full_name.split
    @first_name = split_name.first
    @last_name = split_name.length > 1 ? split_name.last : ''
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# p bob.name == rob.name
# p bob == rob

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

class Animal
  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Animal
  def swim
    "can't swim!"
  end
  
  def speak
    'meow!'
  end
end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# dog2 = Bulldog.new
# puts dog2.speak
# puts dog2.swim

kitty = Cat.new
puts kitty.speak
puts kitty.swim
puts kitty.jump
puts kitty.run
=end

# class Computer
#   def initialize
#     @name = 
#   end

#   def choose
#     self.move = Move.new(Move::VALUES.sample)
#   end
# end

# class R2D2 
# end

# class Hal 
# end

# class Chappie 
# end

# class Sonny 
# end

# test = [R2D2.new, Hal.new, Chappie.new, Sonny.new].sample
# p test

# class Animal
#   def move
#   end
# end

# class Fish < Animal
#   def move
#     puts "swim"
#   end
# end

# class Cat < Animal
#   def move
#     puts "walk"
#   end
# end

# # Sponges and Corals don't have a separate move method - they don't move
# class Sponge < Animal; end
# class Coral < Animal; end

# animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
# animals.each { |animal| animal.move }

# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def initialize
#     @guests = ["Billy", "Jessica"]
#     @flowers = ["lilies", "tulips"]
#     @songs = ["Eye of the Tiger", "Africa"]
#   end

#   def prepare(preparers)
#     preparers.each do |preparer|
#       preparer.prepare_wedding(self)
#     end
#   end

# end

# class Chef
#   def prepare_wedding(wedding)
#     prepare_food(wedding.guests)
#   end

#   def prepare_food(guests)
#     puts "Preparing food for #{guests[0]} and #{guests[1]}"
#   end
# end

# class Decorator
#   def prepare_wedding(wedding)
#     decorate_place(wedding.flowers)
#   end

#   def decorate_place(flowers)
#     puts "Placing the #{flowers[0]} and #{flowers[1]} on the tables"
#   end
# end

# class Musician
#   def prepare_wedding(wedding)
#     prepare_performance(wedding.songs)
#   end

#   def prepare_performance(songs)
#     puts "Qeueing up #{songs[0]} and #{songs[1]}"
#   end
# end

# joe = Chef.new
# bob = Decorator.new
# linda = Musician.new
# staff = [joe, bob, linda]
# sean_and_dyani = Wedding.new
# sean_and_dyani.prepare(staff)

# class Cat
#   attr_accessor :name
  
#   @@total_cats = 0

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# puts mitzi.jump # => "Mitzi is jumping!"
# puts Cat.total_cats # => 1
# puts "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

# class Student
#   attr_accessor :grade

#   def initialize(name, grade=nil)
#     @name = name
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
# p ade.grade

# class Student
#   attr_accessor :name
#   attr_writer :grade

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# jon = Student.new('John', 22)
# puts jon.name # => 'John'
# jon.name = 'Jon'
# jon.grade = 'B'
# puts jon.grade # => 'B'

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# puts sir_gallant.name # => "Sir Gallant"
# puts sir_gallant.speak # => "Sir Gallant is speaking."

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Thief < Character
#   def speak; "#{name} is whispering..."; end
# end

# sneak = Thief.new("Sneak")
# puts sneak.name # => "Sneak"

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# puts FarmAnimal.new.speak
# puts Sheep.new.speak # => "Sheep says baa!"
# puts Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# puts Cow.new.speak # => "Cow says mooooooo!"

# class Person 
#   @@total_person = 0 
#   def get_name
#     @name                     # the @name instance variable is not initialized anywhere
#   end
# end

# bob = Person.new
# puts bob.get_name                  # => nil
# puts Person.total_person

# class Car
#   WHEELS = 4

#   def wheels
#     WHEELS
#   end
# end

# class Motorcycle < Car
#   WHEELS = 2

#   def wheels
#     WHEELS
#   end
# end

# civic = Car.new
# puts civic.wheels # => 4

# bullet = Motorcycle.new
# puts bullet.wheels # => 4, when you expect the out to be 2

# class Car
#   WHEELS = 4

#   def initialize(type)
#     @type = type
#     @wheels = WHEELS
#   end
# end

# class Ferrari < Car
#   def replace_wheels
#     puts "You put #{WHEELS} brand new wheels on your Ferrari."
#   end
# end

# my_car = Ferrari.new('Sports')
# my_car.replace_wheels

# module Inflatable
#   def inflate
#     puts "You put air in all #{self.class::WHEELS} wheels."
#   end
# end

# class Car
#   include Inflatable
#   WHEELS = 4
# end

# class Motorcycle
#   include Inflatable
#   WHEELS = 2
# end

# my_car = Car.new
# my_car.inflate

# my_moto = Motorcycle.new
# my_moto.inflate

# module Mod
#   CONST = "This isn't the constant you're looking for..."
# end

# CONST = 'does it look globally?'

# class MyClass
#   include Mod
# end

# class MyOtherClass < MyClass
#   def call_constant
#     puts CONST
#   end
# end

# my_obj = MyOtherClass.new

# my_obj.call_constant  

# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{SIDES} sides."
#   end
# end

# SIDES = 4

# class Shape
#   include Describable

#   def self.sides
#     SIDES
#   end
# end

# class Quadrilateral < Shape
# end

# class Square < Quadrilateral; end

# puts Square.sides   # uninitialized constant Shape::SIDES (NameError)

# class Person
#   attr_reader :age

#   def initialize(age)
#     begin
#       validate_age(age)
#     rescue RuntimeError => e
#       puts e.message              #=> "invalid age"
#     end
#     @age = age
#   end

#   def validate_age(age)
#     raise("invalid age") unless (0..105).include?(age)
#   end
# end

# my_person = Person.new(105)
# puts my_person.age
# puts my_person

# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# Vehicle.wheels 

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# puts Vehicle.wheels                              # => 2  Yikes!
# puts Motorcycle.wheels                           # => 2

# str1 = 'test'
# str2 = 'test'
# puts str1 == str2
# puts str1.object_id == str2.object_id
# puts str1.equal?(str2)
# puts str1.eql?(str2)

# str1 = "I am a string"
# str2 = "I am a string"
# p str1 # "I am a string"
# p str2 # "I am a string"
# puts str1 == str2
# puts str1.equal?(str2)
# puts str1 === str2
# puts (str1 <=> str2) == 0

# class Thing
#   attr_accessor :size

#   def initialize(s)
#     @size = s
#   end

#   def ==(other_thing)
#     size == other_thing.size
#   end
# end

# thing1 = Thing.new(5)
# thing2 = Thing.new(5)
# thing3 = thing1
# thing1.size = 4

# puts thing1 == thing2
# puts thing2 == thing3
# puts thing3.equal? thing2
# puts thing3.equal? thing1
# puts thing1.object_id 
# puts thing3.object_id

# class Circle
#   attr_reader :radius

#   def initialize(r)
#     @radius = r
#   end

#   def >(other)
#     radius > other.radius
#   end

#   def ==(other)
#     radius == other.radius
#   end
# end

# circle1 = Circle.new(5)
# circle2 = Circle.new(3)
# circle3 = Circle.new(5)

# puts circle1 > circle2
# # puts circle2 < circle3
# puts circle1 == circle3
# puts circle3 != circle2

# number = 21

# puts case number
# when 1          then 'first'
# when 10, 20, 30 then 'second'
# when 40..49     then 'third'
# end

# module Speedy
#   def run_fast
#     @speed = 70
#   end
# end

# class Animal
#   attr_reader :dog_age, :name, :age, :speed

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Dog < Animal
#   DOG_YEARS = 7

#   def initialize(name, age)
#     @dog_age = age * DOG_YEARS
#   end
# end

# class Greyhound < Dog
#   include Speedy
# end

# grey = Greyhound.new('Grey', 3)
# puts grey.dog_age
# puts grey.name
# puts grey.age
# puts grey.speed

# class Shape
#   @@sides = nil

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# class Shape
#   @@sides = nil

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# # new_tri = Triangle.new
# # puts new_tri.sides
# # puts Triangle.new.sides
# # new_quad = Quadrilateral.new
# # puts new_quad.sides
# # puts Quadrilateral.new.sides
# # puts new_tri.sides
# # puts Triangle.new.sides

# puts Quadrilateral.new.sides
# puts Triangle.new.sides

# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{self.class::SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
#     self::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4

#   def sides; SIDES; end
# end

# class Square < Quadrilateral; end

# puts Square.sides # => 4
# puts Square.new.sides # => 4
# puts Square.new.describe_shape # => "I am a Square and have 4 sides."

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast

# Truck.new.go_fast

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# puts oracle.predict_the_future

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# puts trip.predict_the_future

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# puts HotSauce.ancestors
# puts Orange.ancestors

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# puts Cat.cats_count
# new_cat1 = Cat.new('Tortie')
# new_cat2 = Cat.new('Black')
# puts Cat.cats_count

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end

#   def self.hi
#     "Hello"
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# puts Hello.hi

# class Cat
#   attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def display_type
#     "I am a #{type} cat"
#   end
# end

# new_cat = Cat.new('tabby')
# puts new_cat
# puts new_cat.display_type

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer
# tv.model

# Television.manufacturer
# Television.model

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# new_cat = Cat.new('tabby')
# new_cat.make_one_year_older
# puts new_cat.age

# def display_board(clear_screen: true)
#   system 'clear' if clear_screen
# end

# display_board

  # algorithm
  # find the size of the array, size
  # size 0 => return ''
  # size 1 => return the first item in the array
  # size 2 => join item1 and item2 with 'or '

  # size 2 or more
    # split the array into two parts
    # first part all the items except the last, first_items
    # create the return string:
      # join together first_items with the delimiter passed in
      # add a trailing delimiter to the first_items (if first_items is more than one item)
      # add the 'or '
      # add the last item

# def joinor(unmarked_keys, delim = ', ', word_sep = 'or')
#   case unmarked_keys.size
#   when 0 then ''
#   when 1 then unmarked_keys.first
#   when 2 then unmarked_keys.join(" #{word_sep} ")
#   else
#     or_delim = "#{delim}or "
#     first_items = unmarked_keys[0...-1]
#     "#{first_items.join(delim)}#{or_delim}#{unmarked_keys.last}"
#   end
# end

# p joinor([], ', ')
# p joinor([1], ', ')
# p joinor([1, 8], ', ')
# p joinor([1, 8, 9], ', ')
# p joinor([1, 6, 8, 9], ', ')

# class Child
#   # other methods omitted

#   def instance_of?
#     p "I am a fake instance"
#   end
# end

# heir = Child.new
# heir.instance_of? # Child

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def dog_name
#     "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name                       # => bark! bark! bark! bark!
# puts Dog.ancestors

# class Vehicle
#   # WHEELS = 4
# end

# WHEELS = 6

# class Car < Vehicle
#   def wheels
#     WHEELS
#   end
# end

# car = Car.new
# puts car.wheels        # => 4

# class Customer
#   attr_reader :order
  
#   def place_order
#     @order = Order.new
#   end
# end

# class Order
#   def initialize
#     @burger = Burger.new
#     @side = Side.new
#     @drink = Drink.new
#   end
  
#   def meal
#     [@burger, @side, @drink]
#   end
  
#   def total
#     total_cost = @burger.cost + @side.cost + @drink.cost
#     format("$%.2f", total_cost) # #format formats the cost to two decimal places
#   end

#   def to_s
#     meal.map(&:to_s).join(', ')
#   end
# end

# class MealItem
#   def initialize
#     @option = choose_option
#   end
  
#   def choose_option
#     puts "Please choose a #{self.class} option:"
#     puts item_options # item_options returns a list of options and prices
#                       # for a particular item type
#     gets.chomp
#   end

#   def item_options
#     self.class::OPTIONS
#   end

#   def cost
#     self.class::OPTIONS[@option][:cost]
#   end

#   def to_s
#     self.class::OPTIONS[@option][:name]
#   end
# end

# class Burger < MealItem
#   OPTIONS = {
#     '1' => { name: 'LS Burger', cost: 3.00 },
#     '2' => { name: 'LS Cheeseburger', cost: 3.50 },
#     '3' => { name: 'LS Chicken Burger', cost: 4.50 },
#     '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
#   }
# end

# class Side < MealItem
#   OPTIONS = {
#     '1' => { name: 'Fries', cost: 0.99 },
#     '2' => { name: 'Onion Rings', cost: 1.50 }
#   }
# end

# class Drink < MealItem
#   OPTIONS = {
#     '1' => { name: 'Cola', cost: 1.50 },
#     '2' => { name: 'Lemonade', cost: 1.50 },
#     '3' => { name: 'Vanilla Shake', cost: 2.00 },
#     '4' => { name: 'Chocolate Shake', cost: 2.00 },
#     '5' => { name: 'Strawberry Shake', cost: 2.00 }
#   }
# end

# test_cust = Customer.new
# test_cust.place_order
# puts test_cust.order
# puts test_cust.order.total

# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
#     self::SIDES
#   end
  
#   def sides
#     self.class::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4
# end

# class Square < Quadrilateral; end

# p Square.sides 
# p Describable.ancestors
# p Square.new.sides 
# p Square.new.describe_shape  



# attr_reader :name
# attr_accessor :name
# def name
#   @name
# end

# class Foo
#   attr_reader :bar, :baz, :qux

#   def initialize
#     @bar = 1
#     @baz = 2
#   end

#   def quux
#     @qux = 3
#   end
# end

# foo = Foo.new
# p foo.bar # => 1
# p foo.baz # => 2
# p foo.qux # => nil

# class Dog
#   def initialize(name)
#     @name = name
#   end

#   def self.info
#     puts "All dogs are good boys!"
#   end
# end

# benji = Dog.new('Benji')
# benji.info

# class Player
#   attr_reader :strength, :intelligence, :name
  
#   def initialize(name)
#     @name = name
#     @health = 100
#     roll_dice
#   end

#   def heal(change_amount)
#     self.health += change_amount
#   end

#   def hurt(change_amount)
#     self.health -= change_amount
#   end

#   def to_s
#     <<~HEREDOC
#       "Name: #{name}"
#       "Class: #{self.class}"
#       "Health: #{health}"
#       "Strength: #{strength}"
#       "Intelligence: #{intelligence}"
#     HEREDOC
#   end

#   private

#   def roll_dice
#     @strength = (2..12).to_a.sample
#     @intelligence = (2..12).to_a.sample
#   end

#   attr_accessor :health
# end

# module Armor
#   def attach_armor
#   end

#   def remove_armor
#   end
# end

# module CastSpell
#   def cast_spell(spell)
#   end
# end

# class Warrior < Player
#   include Armor

#   def initialize(name)
#     super(name)
#     @strength += 2
#   end
# end

# class Paladin < Player
#   include Armor
#   include CastSpell
# end

# class Magician < Player
#   include CastSpell

#   def initialize(name)
#     super(name)
#     @intelligence += 2
#   end
# end

# class Bard < Magician
#   def create_potion
#   end
# end

# new_player = Paladin.new('Liz')
# puts new_player
# puts new_player.hurt(5)


# class Animal
#   def talk
#     puts "I am a generic animal"
#   end
# end

# class Fish < Animal; end

# class Dog < Animal
#   def talk
#     puts "woof"
#   end
# end

# class Cat < Animal
#   def talk
# 		puts "meow"
#   end
# end

# array_of_animals = [Fish.new, Dog.new, Cat.new]
# array_of_animals.each do |animal|
#   animal.talk
# end

# last assessment question
# class Player
#   attr_reader :strength, :intelligence, :name
  
#   def initialize(name)
#     @name = name
#     @health = 100
#     @strength = roll_dice
#     @intelligence = roll_dice
#   end

#   def heal(incr_value)
#     self.health += incr_value
#   end

#   def hurt(incr_value)
#     self.health -= incr_value
#   end

#   def to_s
#     <<~HEREDOC
#     Name: #{name}
#     Class: #{self.class}
#     Health: #{health}
#     Strength: #{strength}
#     Intelligence: #{intelligence}
#     HEREDOC
#   end

#   private
#   def roll_dice
#     (2..12).to_a.sample
#   end

#   attr_accessor :health
# end

# module Armorable
#   def attach_armor
#     puts "Attaching armor"
#   end

#   def remove_armor
#     puts "Removing armor"
#   end
# end

# module CastSpell
#   def cast_spell(spell)
#   end
# end

# class Warrior < Player
#   include Armorable
  
#   def initialize
#     super
#     @strength += 2
#   end
# end

# class Paladin < Player
#   include Armorable
#   include CastSpell
# end

# class Magician < Player
#   include CastSpell

#   def initialize
#     super
#     @intelligence += 2
#   end
# end

# class Bard < Magician
#   def create_potion
#   end
# end

# liz = Paladin.new("Liz")
# puts liz
# liz.hurt(50)
# puts liz

# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def higher_grade?(other_person)
#     grade > other_person.grade
#   end

#   def display_name
#     puts "Name: #{name}"
#   end

#   private

#   attr_reader :name

#   protected

#   attr_reader :grade
# end

# no_1_student = Student.new("Jennifer", 99)
# liz = Student.new("Liz", 92)
# puts liz.higher_grade?(no_1_student) # error if private instead of protected
# # liz.grade # NoMethodError (protected method)
# liz.display_name
# liz.name # NoMethodError (private method)


# class Person
#   def initialize(name, job)
#       @name = name
#       @job = job
#   end 

#   def to_s; "My name is #{@name} and I am a #{@job}"; end
# end

# roger = Person.new("Roger", "Carpenter")
# puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 
# Other than that don't change Person.
# Output:
# "My name is Roger and I am a Carpenter"

# class Human 
#   attr_reader :name
#   attr_accessor :hr_colour

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def self.hair_colour(name = "Dylan", new_colour)
#     "Hi, my name is #{name} and I have blonde hair."
#   end

#   def hair_colour(new_colour)
#     self.hr_colour = new_colour
#     "Hi, my name is #{name} and I have #{hr_colour} hair."
#   end
# end

# puts Human.new("Jo").hair_colour("blonde")  
# # Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_colour("")              
# # Should output "Hi, my name is Dylan and I have blonde hair."

# class Human  # Problem received from Raul Romero
#   attr_reader :name 
#   @@name_list = []
  
#   def initialize(name)
#     @name = name
#     # check for duplicate name
#     if dup_name?(name)
#       @anna_flag = 'Y' 
#     else
#       add_name(name)
#     end
#   end

#   def add_name(name)
#     @@name_list << name
#   end

#   def dup_name?(name)
#     @@name_list.include?(name)
#   end
  
#   def equal?(other)
#     name == other.name
#   end

#   def to_s
#     if @anna_flag == 'Y'
#       'anna'
#     else
#       name
#     end
#   end

#   def gilles
#     'gilles'
#   end

#   def +(other)
#     to_s + other.name
#   end
# end

# gilles = Human.new("gilles") 
# anna = Human.new("gilles") 

# # puts anna.equal?(gilles) #should output true # 
# puts anna + gilles # should output annagilles 
# # puts gilles

# equal? checks to see if two objects are the same

#describe what the code below outputs and why from Joseph Ochoa

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Characters
#   def attack
#     "The #{self.class} attacks!"
#   end

#   attr_accessor :characters 
  
#   def initialize(name) 
#     #
#     self.name = name
#     @characters = [] 
#   end
  
#   def display
#     name
#   end
  
#   protected 

#   attr_reader :name
#   attr_writer :name
# end

# class Monster < Characters
#   def initialize(name)
#     super
#   end
# end

# class Barbarian < Characters
#   def ==(other)
#     if(super.self == super.self) # 
#       super.self == super.self
#     end
#   end
# end

# conan = Barbarian.new('barb') 
# p conan
# rob = Monster.new('monst')
# p rob
# conan.characters << rob
# p conan
# p conan.display
# p conan.attack
# p rob.attack

# array_of_attackers = [Characters.new('bob'), Barbarian.new('sally'), Monster.new('harry')]
# array_of_attackers.each do |attacker|
#   p attacker.attack
# end

# ================================================================

# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

  # ================================================================

  # Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
# class ClassA 
#   attr_reader :field1, :field2
  
#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end
# end

# class ClassB 
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end
# end


# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new


# p obj1.field2 > obj2.field2
# p obj2.field1 > obj3.field1

# ========================================================================
# Unknown
# class BenjaminButton 
#   attr_accessor :actual_age, :appearance_age

#   def initialize
#     @actual_age = 0
#     @appearance_age = 100
#   end
  
#   def get_older
#     self.actual_age += 1
#     self.appearance_age -= 1
#   end
  
#   def look_younger
#   end
  
#   def die
#     self.actual_age = 100
#     self.appearance_age = 0
#   end
# end

# class BenjaminButton
# end


# benjamin = BenjaminButton.new
# p benjamin.actual_age # => 0
# p benjamin.appearance_age # => 100

# benjamin.actual_age = 1
# p benjamin.actual_age

# benjamin.get_older
# p benjamin.actual_age # => 2
# p benjamin.appearance_age # => 99

# benjamin.die
# p benjamin.actual_age # => 100
# p benjamin.appearance_age # => 0

# class Wizard
# class Wizard
#   attr_reader :name, :hitpoints
  
#   def initialize(name, hitpoints)
#     @name = name
#     @hitpoints = hitpoints
#   end  
  
#   def fireball
#     "casts Fireball for 500 damage!"
#   end
  
# end

# class Summoner < Wizard
#   attr_reader :souls
  
#   def initialize(name, hitpoints)
#     super
#     @souls = []
#   end
  
#   def soul_steal(character)
#     @souls << character
#   end
# end

# gandolf = Summoner.new("Gandolf", 100)
# p gandolf.name # => "Gandolf"

# valdimar = Wizard.new("Valdimar", 200)
# p valdimar.fireball #=> "casts fireball for 500 damage!"

# p gandolf.hitpoints #=> 100

# p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

# p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"

# LS Man...legend says LS Man first appeared in SPOT.
# module Flightable
#   def fly
#     "I am #{name}, I am a #{self.class.to_s.downcase}, and I can fly!"
#   end
# end

# class Superhero
#   include Flightable
  
#   attr_accessor :ability
  
#   def self.fight_crime
#     puts "I am #{self}!"
#     announce_ability
#   end
  
#   def initialize(name)
#     @name = name
#   end
  
#   def self.announce_ability
#     puts "I fight crime with my #{ability} ability!"
#   end

#   private

#   attr_reader :name
# end

# class LSMan < Superhero 
#   @@ability = 'coding skills'

#   def self.ability
#     @@ability
#   end
# end

# class Ability
#   attr_reader :description

#   def initialize(description)
#     @description = description
#   end
# end

# superman = Superhero.new('Superman')

# p superman.fly # => I am Superman, I am a superhero, and I can fly!

# LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
# ========================================================================

# module FourWheeler
#   WHEELS = 4
# end

# class Vehicle
#   def maintenance
#     "Changing #{WHEELS} tires."
#   end
# end

# class Car < Vehicle
#   include FourWheeler

#   def wheels
#     WHEELS
#   end
# end

# car = Car.new
# puts car.wheels        # => 4
# puts Vehicle.ancestors
# puts car.maintenance   # => NameError: uninitialized constant Maintenance::WHEELS

# class Vehicle
# 	@@wheels = 4

# 	def self.wheels
# 		@@wheels
# 	end
# end

# class Motorcycle < Vehicle
# 	@@wheels = 2
# end

# class Car < Vehicle
# end

# puts Motorcycle.wheels # => 2
# puts Vehicle.wheels # => 2
# puts Car.wheels # => 2

# class Animal
# 	def move
# 		"I move"
# 	end
# end

# class Fish < Animal
# 	def move
# 		"I swim"
# 	end
# end

# class Snake < Animal
# end

# nemo = Fish.new
# puts nemo.move # => "I swim"
# bob = Snake.new
# puts bob.move  # => "I move"
# puts Snake.ancestors

# What happens if you mutate a setter's argument in the method body?
# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def name=(new_name)
#     @name = new_name
#   end

#   def setter_return
#     puts self.name='Elizabeth'
#   end
# end

# # Example
# liz = Person.new('Liz')
# p liz.setter_return

# Quiz 2 - question 1
# class Cat
#   attr_reader :name
#   @@total_cats = 0

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

# question 2
# class Student
#   attr_accessor :grade

#   def initialize(name, grade=nil)
#     @name = name
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

# question 4
# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."

# question 6
# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     "baaaaaaa!"
#   end
# end

# class Cow
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"

# Quiz 1 question 11
# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak

# question 17
# class MeMyselfAndI
#   p self

#   def self.me
#     self
#   end

#   def myself
#     self
#   end
# end

# i = MeMyselfAndI.new
# p MeMyselfAndI.me
# p i.myself

# Quiz 3 question 5
# class Thing
#   attr_accessor :size

#   def initialize(s)
#     @size = s
#   end

#   def ==(other_thing)
#     size == other_thing.size
#   end
# end

# thing1 = Thing.new(5)
# thing2 = Thing.new(5)
# thing3 = thing1
# p thing3.object_id == thing1.object_id
# thing1.size = 4
# p thing3.size
# p thing3.equal? thing1
# p thing3.equal? thing2

# question 6
# class Circle
#   attr_reader :radius

#   def initialize(r)
#     @radius = r
#   end

#   def >(other)
#     radius > other.radius
#   end

#   def ==(other)
#     radius == other.radius
#   end
# end

# circle1 = Circle.new(5)
# circle2 = Circle.new(3)
# circle3 = Circle.new(5)
# p circle1 > circle2
# p circle1 == circle3
# p circle3 != circle2

# question 10
# class Shape
#   @@sides = nil

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# p Triangle.sides
# # p Quadrilateral.sides
# p Quadrilateral.new.sides
# # p Triangle.new.sides
# p Triangle.sides

# Exam
# question 16
# class Player
#   attr_reader :health, :strength, :intelligence, :name
  
#   def initialize(name)
#     @name = name
#     @health = 100
#     @strength = roll_dice
#     @intelligence = roll_dice
#   end

#   def heal(amt)
#     self.health += amt
#   end

#   def hurt(amt)
#     self.health -= amt
#   end

#   def to_s
#     <<~HEREDOC
#     "Name: #{name}"
#     "Class: #{self.class}"
#     "Health: #{health}"
#     "Strength: #{strength}"
#     "Intelligence: #{intelligence}"
#     HEREDOC
#   end
#   private

#   attr_writer :health

#   def roll_dice
#     (2..12).to_a.sample
#   end
# end

# module Armor
#   def attach_armor
#   end

#   def remove_armor
#   end
# end

# module CastSpell
#   def cast_spell(spell)
#   end
# end

# class Warrior < Player
#   include Armor
  
#   def initialize(name)
#     super
#     @strength = roll_dice + 2
#   end
# end

# class Paladin < Player
#   include Armor
#   include CastSpell
# end

# class Magician < Player
#   include CastSpell
  
#   def initialize(name)
#     super
#     @intelligence = roll_dice + 2
#   end
# end

# class Bard < Magician
#   def create_potion
#   end
# end

# liz = Magician.new('Liz')
# p liz.health
# p liz.strength
# p liz.intelligence
# puts liz

# question 15
# class PetShelter
#   def initialize
#     @available_pets = []
#   end

#   def add_pet(pet)
#     @available_pets << pet
#   end

#   def show_available_pets
#     @available_pets.each do |pet|
#       puts pet
#     end
#   end
# end

# class Pet
#   attr_reader :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def to_s
#     "#{self.class}: #{name}, age #{age}"
#   end
# end

# class Dog < Pet
# end

# class Cat < Pet
# end

# vesta = Dog.new('Vesta', 8)
# dorrie = Cat.new('Dorrie', 2)
# shelter = PetShelter.new
# shelter.add_pet(vesta)
# shelter.add_pet(dorrie)
# shelter.show_available_pets

# question 14
# module Swimmable
# end

# module Aquatic
# end

# class Animal
# end

# class Fish < Animal
#   include Aquatic
#   include Swimmable
# end

# class ClownFish < Fish
# end

# nemo = ClownFish.new
# # marlin = ClownFish.new
# marlin = nemo

# p nemo == marlin # returns false


# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak


# class Customer
#   def place_order
#     @order = Order.new
#   end
# end

# class Order
#   def initialize
#     @burger = Burger.new
#     @side = Side.new
#     @drink = Drink.new
#   end
  
#   def meal
#     [@burger, @side, @drink]
#   end

#   def to_s
#     meal.map(&:to_s).join(', ')
#   end

#   def total
#     total_cost = @burger.cost + @side.cost + @drink.cost
#     format("$%.2f", total_cost) # #format formats the cost to two decimal places
#   end
# end

# class MealItem
#   def initialize
#     @option = choose_option
#   end
  
#   def choose_option
#     puts "Please choose a #{self.class} option:"
#     puts item_options # item_options returns a list of options and prices
#                       # for a particular item type
#     gets.chomp
#   end

#   def item_options
#     self.class::OPTIONS
#   end

#   def to_s
#     self.class::OPTIONS[@option][:name]
#   end

#   def cost
#     self.class::OPTIONS[@option][:cost]
#   end
# end

# class Burger < MealItem
#   OPTIONS = {
#     '1' => { name: 'LS Burger', cost: 3.00 },
#     '2' => { name: 'LS Cheeseburger', cost: 3.50 },
#     '3' => { name: 'LS Chicken Burger', cost: 4.50 },
#     '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
#   }
# end

# class Side < MealItem
#   OPTIONS = {
#     '1' => { name: 'Fries', cost: 0.99 },
#     '2' => { name: 'Onion Rings', cost: 1.50 }
#   }
# end

# class Drink < MealItem
#   OPTIONS = {
#     '1' => { name: 'Cola', cost: 1.50 },
#     '2' => { name: 'Lemonade', cost: 1.50 },
#     '3' => { name: 'Vanilla Shake', cost: 2.00 },
#     '4' => { name: 'Chocolate Shake', cost: 2.00 },
#     '5' => { name: 'Strawberry Shake', cost: 2.00 }
#   }
# end

# cust_order = Order.new
# p cust_order
# p cust_order.total

# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     "#{@first_name} #{@last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(new_grade)
#     self.grade = new_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"

# class Person
#   attr_accessor :first_name, :last_name
  
#   def initialize(input_name)
#     self.name=(input_name)
#   end

#   def name=(input_name)
#     name_array = input_name.split(' ')
#     @first_name = name_array.first
#     name_array.size > 1 ? @last_name = name_array.last : @last_name = ''
#   end

#   def name
#     last_name.empty? ? "#{first_name}" : "#{first_name} #{last_name}"
#   end

#   def ==(other)
#     name == other.name
#   end

#   def to_s
#     name
#   end
# end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# p bob == rob

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"


# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def prepare(preparers)
#     preparers.each do |preparer|
#       preparer.prepare_wedding(self)
#     end
#   end
# end

# class Chef
#   def prepare_wedding(wedding)
#     prepare_food(wedding.guests)
#   end
  
#   def prepare_food(wedding.guests)
#     # implementation
#   end
# end

# class Decorator
#   def prepare_wedding(wedding)
#     prepare_venue(wedding.flowers)
#   end

#   def prepare_venue(flowers)
#     # implementation
#   end
# end

# class Musician
#   def prepare_wedding(wedding)
#     prepare_music(wedding.songs)
#   end

#   def prepare_music(songs)
#     #implementation
#   end
# end

# class Student
#   attr_accessor :grade

#   def initialize(name, grade=nil)
#     @name = name
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

# class Person
#   def get_name
#     @name                     # the @name instance variable is not initialized anywhere
#   end
# end

# bob = Person.new
# p bob.get_name                  # => ??

# class Rectangle
#   attr_reader :width, :length

#   def initialize(width, length)
#     @width = width
#     @length = length
#   end

#   def >(other)
#     area > other.area
#   end

#   protected

#   def area
#     width * length
#   end
# end

# class Square < Rectangle
#   def initialize(width)
#     super(width, width)
#   end
# end

# square1 = Square.new(5)
# square2 = Square.new(6)

# puts square1 > square2

# class GeoLocation
#   attr_reader :latitude, :longitude

#   def initialize(latitude, longitude)
#     @latitude = latitude
#     @longitude = longitude
#   end

#   def ==(other)
#     latitude == other.latitude && longitude == other.longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end
# end

# manila = GeoLocation.new(27.2046, 77.4977)
# # golden = GeoLocation.new(39.7555, -105.2211)

# my_home = GeoLocation.new(27.2046, 77.4977)
# sung_home = GeoLocation.new(27.2046, 77.4977)
# p my_home == sung_home

# class Person
#   def get_name
#     @name                     # the @name instance variable is not initialized anywhere
#   end
# end

# bob = Person.new
# p bob.get_name                  # => ??


# class User
# 	def view_screen(user_type)
# 		if user_type == 'StandardUser'
# 			'Reset password displays'
# 		elsif user_type == 'AdminUser'
# 			'Reset password and change username displays'
# 		elsif user_type == 'SuperAdminUser'
# 			'Reset password, change username, and delete user displays'
# 		end
# 	end
# end

# bob = User.new
# puts bob.view_screen('AdminUser') # => 'Reset password and change username displays'

# class User
# 	def view_screen(user)
# 		user.view_screen
# 	end
# end

# class StandardUser
# 	def view_screen
# 		'Reset password displays'
# 	end
# end

# class AdminUser
# 	def view_screen
# 		'Reset password and change username displays'
# 	end
# end

# class SuperAdminUser
# 	def view_screen
# 		'Reset password, change username, and delete user displays'
# 	end
# end

# bob = AdminUser.new
# puts bob.view_screen # => 'Reset password and change username displays'

# module Towable
# 	def tow
# 		"I'm towing!"
# 	end
# end

# class Vehicle
# 	def clearance
# 		"Clearance is dependent on the vehicle type"
# 	end
# end

# class Car < Vehicle
# 	def clearance
# 		"Be careful going over speed bumps"
# 	end
# end

# class SUV < Vehicle
# 	include Towable

# 	def clearance
# 		"I have decent clearance"
# 	end
# end

# class Truck < Vehicle
# 	include Towable

# 	def clearance
# 		"I have the best clearance"
# 	end
# end

# vehicles = [Car.new, SUV.new, Truck.new]
# vehicles.each do |vehicle|
# 	puts vehicle.clearance
# end
# # => "Be careful going over speed bumps"
# # => "I have decent clearance"
# # => "I have the best clearance"

# towable_vehicles = [SUV.new, Truck.new]
# towable_vehicles.each do |vehicle|
# 	puts vehicle.tow
# end
# # => "I'm towing!"
# # => "I'm towing!"

# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
# end

# class Cat < Animal
# end

# dorrie = Cat.new('Dorrie')

# class MeMyselfAndI
#   self

#   def self.me
#     self
#   end

#   def myself
#     self
#   end
# end

# i = MeMyselfAndI.new
# p i.myself

class Animal
  def speak
    "The #{self.class} says #{word}"
  end

  def word
    "I'm an animal."
  end
end

class Dog < Animal
  def word
    "woof!"
  end
end

class Fish < Animal
  def speak
    "Fish don't speak!"
  end
end

puts Animal.new.speak # => "The Animal says I'm an animal."
puts Dog.new.speak # => "The Dog says woof!"
puts Fish.new.speak # => "Fish don't speak!"