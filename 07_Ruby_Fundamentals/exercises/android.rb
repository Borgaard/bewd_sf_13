require 'pry'
require 'pry-byebug'
require_relative 'robot'

class Android < Robot
  #creates getter && setter methods for each attribute
  attr_accessor :name, :type, :origin

  #instance_factory to support creating a new person using Person.new
    def initialize(name,origin,type="android")
      #we will work through this in class
    end
  end
