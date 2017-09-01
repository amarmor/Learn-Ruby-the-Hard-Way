# def cars
cars = 100
# def seats in car
space_in_a_car = 4.0
# def number of drivers
drivers = 30
# def number of passengers
passengers = 90
#def number of cars not driven
cars_not_driven = cars - drivers
# def cars driven
cars_driven = drivers
# def carpool capacity
carpool_capacity = cars_driven * space_in_a_car
# def avg passengers per car
average_passengers_per_car = passengers / cars_driven

# states how many cars are available
puts "There are #{cars} cars available"
# states how many drivers are available
puts "There are only #{drivers} drivers available."
# states how many empty cars there are
puts "There will be #{cars_not_driven} empty cars today."
# states how many people can be transported today
puts "We can transport #{carpool_capacity} people today."
# states how many passengers are carpooling today
puts "We have #{passengers} to carpool today."
# states how many people per car
puts "We need to put about #{average_passengers_per_car} in each car."
