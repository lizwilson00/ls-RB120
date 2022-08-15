# RB120
# Exercises
# classes_and_objects_2.rb

=begin
# exercise 1
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting # => Hello! I'm a cat!
kitty = Cat.new
p kitty.class
kitty.class.generic_greeting

# exercise 2
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

# exercise 3
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# exercise 4
class Cat
  attr_reader :name

  @@total_cats = 0

  def self.generic_greeting
    puts "Hello!  I'm a cat!"
  end

  def personal_greeting
    puts "Hello!  My name is #{name}!"
  end

  def initialize(name)
    @name = name
    @@total_cats += 1
  end

  def self.total
    puts @@total_cats
  end
end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting # => Hello! I'm a cat!
# kitty.personal_greeting # => Hello! My name is Sophie!

kitty1 = Cat.new('Sophie')
kitty2 = Cat.new('Luna')

Cat.total

# exercise 6
class Cat
  def initialize(name)
    @name = name
    @color = 'purple'
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{@color} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet # => Hello! My name is Sophie and I'm a purple cat!

# exercise 7
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty # => I'm Sophie!

# exercise 8
class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# exercise 9
class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret
=end

# exercise 10
class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)