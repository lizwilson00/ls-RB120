class Person
  attr_accessor :address
  attr_reader :name
  
  def initialize(name, address)
    @name = name
    @address = address
  end

  def change_name(new_name)
    self.name = new_name
  end

  private

  def name=(new_name)
    @name = new_name
  end
end

class Vendor < Person
  attr_reader :food
  
  def initialize(name, address)
    super
    @food = []
  end
  
  def change_name(new_name)
    super
    # additional logic for uploading a new logo
  end

  def add_food(new_food)
    self.food << new_food
  end

  private

  attr_writer :food
end

class Customer < Person; end

module Perishable
  attr_accessor :perishable
end

class Food
  attr_reader :food_name, :price
  
  def initialize(name, price)
    @food_name = name
    @price = price
  end

  def to_s
    "#{food_name}: $#{price}"
  end
end

class Salad < Food
  include Perishable
end

class Cookies < Food; end

class Dumplings < Food
  include Perishable
end

veggie = Vendor.new('Veggie Heaven', '123 Main Street')
veggie.change_name('Number 1 Veggie Heaven')
p veggie.name
dumplings = Dumplings.new('Mushroom Dumplings', 8)
veggie.add_food(dumplings)
salad = Salad.new('Thai Noodle Salad', 12)
veggie.add_food(salad)
cookies = Cookies.new('Chocolate Chip Cookies', 5)
veggie.add_food(cookies)
puts veggie.food
p salad.perishable='Y'
p salad



