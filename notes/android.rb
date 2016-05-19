require 'pry'
require 'pry-byebug'
require_relative 'robot'

class Android < Robot
  attr_accessor :name, :origin, :type

  def initialize(name,origin,language="english")
    super
    @type = "android"
    @language = language
  end

  def writing_skills
    puts "I have writing skills. I am modern day Shakespeare."
  end

  def dancing_skills
    puts "I have dancing skills" unless origin == "brooklyn"
  end

end

android = Android.new("kisha","brooklyn")
binding.pry 
android.dancing_skills
