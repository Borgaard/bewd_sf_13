require 'pry'
require 'pry-byebug'

class Person
  #getter & setter properties
  attr_accessor :name, :age, :home_town

  def initialize(name,age,home_town)
    @name = name
    @age = age
    @home_town = home_town
  end

  def coding_skills
    if home_town == "San Francisco"
      "I have coding skills"
    else
      "I have been deprived!"
    end
  end

  def self.assess_skills(people)
    people.each do |person|pe
      puts person.coding_skills
    end
  end

  def to_s
    "Hey! I am a person. My name is #{name}. I am from #{home_town}!"
  end
end

person = Person.new("Jane", 97, "San Francisco")
person1 = Person.new("Kisha", 97, "Brooklyn")
person2 = Person.new("Jane", 97, "San Francisco")
people = [person, person1, person2]

Person.assess_skills(people)
