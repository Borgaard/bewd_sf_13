require 'pry'
require 'pry-byebug'

def get_love_interest
  puts "Who do you love? \n"
  love_interest = gets.strip
  get_response(love_interest)
end

def get_response(love_interest)
  puts "Are you thinking of #{love_interest}?\n"
  puts "Answer 'Yes' or 'No' \n"
  answer = gets.strip.downcase
  get_valid_answer(answer, love_interest)
end

def get_valid_answer(answer, love_interest)
  case answer
    when "yes"
      puts "Maybe you should call #{love_interest}?\n"
    when "no"
      puts "Ok, maybe call them soon. You love #{love_interest}!"
    else
      puts "Your answer is the not valid \n"
      puts "Please put 'Yes' or 'No'\n "
      get_response(love_interest)
    end
end

get_love_interest
