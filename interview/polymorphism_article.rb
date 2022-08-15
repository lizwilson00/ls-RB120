module Towable
	def tow
		"I'm towing!"
	end
end

class Vehicle
	def clearance
		"I don't have good clearance"
	end
end

class Car < Vehicle
end

class SUV < Vehicle
	include Towable

	def clearance
		"I have decent clearance"
	end
end

class Truck < Vehicle
	include Towable

	def clearance
		"I have the best clearance"
	end
end

# Polymorphism via Inheritance
vehicles = [Car.new, SUV.new, Truck.new]
vehicles.each do |vehicle|
	puts vehicle.clearance
end
# => "I don't have good clearance"
# => "I have decent clearance"
# => "I have the best clearance"

# Polymorphism via Mixins
towable_vehicles = [SUV.new, Truck.new]
towable_vehicles.each do |vehicle|
	puts vehicle.tow
end
# => "I'm towing!"
# => "I'm towing!"

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

# [StandardUser.new, AdminUser.new, SuperAdminUser.new].each do |user|
#   puts user.view_screen
# end
# # => 'Reset password displays'
# # => 'Reset password and change username displays'
# # => 'Reset password, change username, and delete user displays'