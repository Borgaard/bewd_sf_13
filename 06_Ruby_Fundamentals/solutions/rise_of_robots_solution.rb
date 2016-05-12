require 'pry'

#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

class Robot

  #getter && setter methods for each attribute
  attr_accessor  :name, :type, :origin

  #instance variables are available through the class. @name is an instance variable
  def initialize(name, type, origin)
    @name = name
    @type = type
    @origin = origin
  end

  #instance method
  def fly
    add_wings_and_take_off
  end

 #instance method
  def laser_master
    if type == "Super Android"
      add_laser_training
    else
      puts "I'm an #{type}. I don't have laser skills. Those come with the newer robots"
    end
  end

 #class method
 def self.make_robots(number_of_robots)
  robots = number_of_robots.to_i
  robots.times do
    Robot.random_robot_maker
  end
end

#class method
def self.random_robot_maker
  names = ["Steve", "Donna", "Kelly" "Celeste", "Erik", "Mark", "Ramon"]
  types = ["Super Android", "Android"]
  origins =  ["Venus", "Mars"]

  name = names.sample
  type = types.sample
  origin  = origins.sample

  r = Robot.new(name,type,origin)
  puts "Created robot #{name} of type #{type} from #{origin}"
  return r
end

#overiding to_s method that comes out of the box
def to_s
  "My name is #{name}. I'm #{type}. I was created in #{origin}"
end

private

#usually used within instance && class methods.
def add_wings_and_take_off
  puts "I'm awesome! I'm #{name}, an awesome #{type} with flying skills"
end

def add_laser_training
  puts "I'm SUPER awesome. I'm #{name}, an amazing #{type} with laser fighting skills"
end


end


Robot.random_robot_maker
Robot.make_robots(20)

happy_robot = Robot.random_robot_maker
happy_robot.fly
happy_robot.laser_master
