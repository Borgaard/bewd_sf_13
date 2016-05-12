require 'pry'

class Thermostat
  attr_accessor :degrees
  attr_reader :target

  def initialize(temp, target)
    @degrees = temp
    @target = target
  end

 #self.target , @target and target are all the same inside of this instance method
  def calibrate_temp
    if degrees > target #this the same as #@degrees
      puts "It's #{degrees}That's too hot! Turn on the air conditioner"
    elsif @degrees < @target
      puts "Brr!!! It's #{degrees}. It's too cold. Turn on the heat"
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
end

#The temperature is being read externally somewhere, so let's just create an array of those readings
#and pass them into our class method Thermostat.detect_temperature(all_temps, target_temp)

#array_to_temperatures
all_temps = [45,65,85,95, 66, 99, 75, 12, 22, 45, 65, 75, 70, 100, 10, 52, 22]
#set by user
target_temp = 75

Thermostat.detect_temperature(all_temps, target_temp)
