#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

require 'pry'
require 'pry-byebug'

class Person

#creates getter && setter methods for each attribute
attr_accessor :name, :age, :home_town

#instance_factory to support creating a new person using Person.new
  def initialize(name, age, home_town)
    @name = name
    @age = age
    @home = home
  end
end
