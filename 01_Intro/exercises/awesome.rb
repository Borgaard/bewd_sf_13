require 'pry'

def awesome_number(number)
  if number % 3 == 0 && number % 5 == 0
    puts "Awesome #{number}!"
  elsif number % 3 == 0
    puts "Awe"
  elsif number % 5 == 0
    puts "Some"
  else
    puts "Sorry. The #{number} is just not that awesome"
  end
end

def awesome_seeker(top_num)
  1.upto(top_num) do |number|
    awesome_number(number)
  end
end

awesome_seeker(100)
