# RB120
# Medium 1
# Take 2
# class InvoiceEntry
#   attr_reader :quantity, :product_name
#   attr_writer :quantity

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     self.quantity = updated_count if updated_count >= 0
#   end
# end

# test_invoice = InvoiceEntry.new('staplers', 5)
# test_invoice.update_quantity(-5)
# p test_invoice.quantity

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     filling_words = if @filling_type.nil? then "Plain" 
#                     else "#{@filling_type}" 
#                     end
#     glazing_words = if @glazing.nil? then ''
#                     else " with #{@glazing}"
#                     end
#     filling_words + glazing_words
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
# #  => "Plain"

# puts donut2
# #  => "Vanilla"

# puts donut3
# #  => "Plain with sugar"

# puts donut4
# #  => "Plain with chocolate sprinkles"

# puts donut5
# #  => "Custard with icing"

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# test1 = Computer.new
# test1.create_template
# p test1.show_template

# class Computer
#   attr_accessor :template

#   def create_template
#     self.template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end

# test1 = Computer.new
# test1.create_template
# p test1.show_template

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

test_light = Light.new('super bright', 'blue')
p test_light.status