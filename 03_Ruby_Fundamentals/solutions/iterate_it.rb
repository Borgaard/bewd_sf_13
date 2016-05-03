require 'pry'
require 'pry-byebug'

def the_bee_rockstars
rock_stars = ["Beyonce", "Rihanna", "Drake", "Bob Marley"]
  rock_stars.each do |rock_star|
    puts "#{rock_star}" if rock_star.start_with?("B")
  end
end


def five_char_cars
  cars = ["Tesla", "Ford", "Mercedes", "Toyota"]
  cars.each { |car| puts car if car.length >= 5}
end

#call the methods
the_bee_rockstars
five_char_cars
