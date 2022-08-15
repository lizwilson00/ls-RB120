# class Student
# 	@@num_students = 0

#   attr_accessor :name, :grade

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#     @@num_students += 1
#   end

# 	def view_student
# 		self
# 	end

# 	def self.num_students
# 		@@num_students
# 	end

#   def change_grade(new_grade)
#     grade = new_grade
#   end
# end

# bob = Student.new('Bob', 'B')
# puts bob.view_student # => #<Student:0x000055e89aba0d28>
# puts bob # => #<Student:0x000055e89aba0d28>
# puts Student.num_students # => 1


# bob.change_grade('A')
# puts bob.grade # => 'A'

class Student
	@@num_students = 0

  attr_accessor :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
    @@num_students += 1
  end

	def view_student
		self
	end

	def num_students
		@@num_students
	end
end

bob = Student.new('Bob', 'B')
puts bob.view_student # => #<Student:0x000055e89aba0d28>
puts bob # => #<Student:0x000055e89aba0d28>
puts Student.num_students # => 1

