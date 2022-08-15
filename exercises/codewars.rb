# RB129
# codewars.rb

# Competitive Eating
# https://www.codewars.com/kata/571d2e9eeed4a150d30011e7/ruby
# 7 kyu

# POINTS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2}

# def scoreboard(who_ate_what)
#   results = []
#   who_ate_what.each do |hash|
#     score = 0
#     results_hash = {}
#     hash.each do |key, value|  
#       if key == "name"
#         results_hash["name"] = value
#       else
#         score += value * POINTS[key]
#       end
#     end
#     results_hash["score"] = score
#     results << results_hash
#   end
#   results
# end

# def scoreboard(who_ate_what)
#   # competitors = 
#   add_competitors(who_ate_what)
#   # associate_food(who_ate_what, competitors)
#   # calculate_score(competitors)
#   # output_results
# end

# def add_competitors(who_ate_what)
#   competitors = []
#   who_ate_what.each do |hash|
#     competitors << Competitor.new(hash["name"])
#   end
#   competitors
# end

# def associate_food(who_ate_what, competitors)
  
# end


# class Competitor
#   def initialize(name)
#     @name = name
#   end
# end

# class FoodEaten
# end

# class ChickenWings
#   SCORE_MULTIPLIER

#   end
# end

# class Hamburgers
# end

# class HotDogs
# end

# x = [{"name"=>"Billy The Beast", "chickenwings"=>17 , "hamburgers"=>7, "hotdogs"=>8},{"name"=>"Habanero Hillary", "chickenwings"=>5 , "hamburgers"=>17, "hotdogs"=>11},{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}]
# p scoreboard(x)

class Student
  attr_reader :name
  attr_reader :fives
  attr_reader :tens
  attr_reader :twenties
  # attr_reader :total
  
  def initialize(name, fives, tens, twenties)
    @name = name
    @fives = fives
    @tens = tens
    @twenties = twenties
    # @total = @fives * 5 + @tens * 10 + @twenties * 20
  end
end

def total(student)
  student.fives * 5 + student.tens * 10 + student.twenties * 20
end

def most_money(students)
  return students.first.name if students.size == 1
  return "all" if students.map{ |s| total(s)}.uniq.size == 1
  students.max_by { |s| total(s) }.name
end

phil = Student.new("Phil", 2, 2, 1)
cam = Student.new("Cameron", 2, 2, 0)
geoff = Student.new("Geoff", 0, 3, 0)

p most_money([cam, geoff, phil]) == "Phil"
p most_money([cam, geoff]) == "all"
p most_money([geoff]) == "Geoff"

# 1 student => that student's name
# 2 or more => quantities are equal? then "all", else whoever has largest total

