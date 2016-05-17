require 'pry'

class Thermostat
  #creates getter && setter methods for each attribute
  attr_accessor :current_temp
  attr_reader :target

  def initialize(temp, target)
    @current_temp = temp
    @target = target
  end

 #self.target , @target and target are all the same inside of this instance method
  def calibrate_temp
    if current_temp > target #this the same as #@current_temp
      turn_off_heat
    elsif @current_temp < @target
      turn_on_heat
    else
      puts "ahhh! Just right"
    end
  end

  def self.detect_temperature(all_temps, target_temp)
    all_temps.each do |temp|
      reading = Thermostat.new(temp, target_temp)
      reading.calibrate_temp
    end
  end

  def turn_off_heat
    puts "It's #{current_temp}That's too hot! Turn on the air conditioner"
  end

  def turn_on_heat
    puts "Brr!!! It's #{current_temp}. It's too cold. Turn on the heat"
  end
end

#The temperature is being read externally somewhere, so let's just create an array of those readings
#and pass them into our class method Thermostat.detect_temperature(all_temps, target_temp)

#array_to_temperatures
all_temps = [45,65,85,95, 66, 99, 75, 12, 22, 45, 65, 75, 70, 100, 10, 52, 22]
#set by user
target_temp = 75

Thermostat.detect_temperature(all_temps, target_temp)
