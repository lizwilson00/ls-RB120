# RB120
# Textbook Exercises

=begin
module MyModule
end

class ExampleClass
  include MyModule
end

new_object = ExampleClass.new
=end

=begin
Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

Add a class method to your MyCar class that calculates the gas mileage of any car.
=end

=begin
class Vehicle
  @@number_of_vehicles = 0
  
  def initialize
    @@number_of_vehicles += 1
  end

  def self.calc_gas_mileage(miles, gallons)
    puts "The car gets #{miles / gallons} miles per gallon."
  end

  def self.number_of_vehicles
    puts "#{@@number_of_vehicles} vehicles have been created in total."
  end

  attr_accessor :color, :model
  attr_reader :year

  def initialize(yr, col, mod)
    @year = yr
    @color = col
    @model = mod
    @curr_speed = 0
    @status = "on"
  end

  def incr_speed(qty)
    @curr_speed += qty
    puts "You have increased your speed by #{qty} mph."
  end

  def decr_speed(qty)
    @curr_speed -= qty
    puts "You have decreased your speed by #{qty} mph."
  end

  def shut_off
    @curr_speed = 0
    @status = "off"
    puts "You have shut the vehicle off."
  end

  def curr_speed
    puts "The vehicle's current speed is #{@curr_speed} mph."
  end

  def spray_paint(col)
    self.color = col
    puts "You spray painted your vehicle #{@color}!"
  end

  def age
    puts "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Towable
  def tow_capacity(pounds)
    pounds < 2000 ? "Not Really" : "Yes"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Towable

  def to_s
    "Your truck is a #{year} #{color} #{model}.  Nice ride!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    puts "Your car is a #{year} #{color} #{model}.  Nice ride!"
  end
end

# kona = MyCar.new(2019, "white", "Kona")
# kona.incr_speed(40)
# kona.decr_speed(5)
# kona.curr_speed
# kona.decr_speed(15)
# kona.shut_off
# kona.curr_speed

# Add an accessor method to your MyCar class to change and view the color of your car. Then add an 
# accessor method that allows you to view, but not modify, the year of your car.
# p kona.color
# kona.color = "green"
# p kona.color
# p kona.year

# You want to create a nice interface that allows you to accurately describe the action you want
# your program to perform. Create a method called spray_paint that can be called on an object and
# will modify the color of the car.
# p kona.color
# kona.spray_paint("pink")

# Add a class method to your MyCar class that calculates the gas mileage of any car.
# MyCar.calc_gas_mileage(450, 14)

# Override the to_s method to create a user friendly print out of your object.
# puts kona

# puts "---MyCar method lookup---"
# puts MyCar.ancestors
# puts "---MyTruck method lookup---"
# puts MyTruck.ancestors
# puts "---Vehicle method lookup---"
# puts Vehicle.ancestors

# problem #5 - moving methods from MyCar to Vehicle
# kona = MyCar.new(2019, "white", "Kona")
# kona.incr_speed(40)
# kona.decr_speed(5)
# kona.curr_speed
# kona.decr_speed(15)
# kona.shut_off
# kona.curr_speed
# puts kona

# ranger = MyTruck.new(2022, "gray", "Ranger")
# ranger.incr_speed(40)
# ranger.decr_speed(5)
# ranger.shut_off
# ranger.curr_speed
# puts ranger

# problem # 6 - private method
kona = MyCar.new(2019, "white", "Kona")
puts kona.age
puts kona.years_old
=end

# problem # 7
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  
  attr_reader :grade
end

bob = Student.new("Bob", 85)
joe = Student.new("Joe", 95)
puts "Well done!" if joe.better_grade_than?(bob)
puts joe.grade