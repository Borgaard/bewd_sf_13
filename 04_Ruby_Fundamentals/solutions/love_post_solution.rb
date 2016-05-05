require 'pry'
require 'pry-byebug'

def get_love_interest
  puts "Who do you love? \n"
  love_interest = gets.strip
  capture_love_interest_response(love_interest)
end

def capture_love_interest_response(love_interest)
  puts "Are you thinking of #{love_interest}?\n"
  puts "Answer 'Yes' or 'No' \n"
  user_answer = gets.strip.downcase
  get_valid_answer(user_answer, love_interest)
end

def get_valid_answer(user_answer, love_interest)
  case user_answer
    when "yes"
      puts "Maybe you should call #{love_interest}?\n"
    when "no"
      puts "Ok, maybe call them soon. You love #{love_interest}!"
    else
      puts "Your answer is the not valid \n"
      puts "Please put 'Yes' or 'No'\n "
      capture_love_interest_response(love_interest)
    end
end

### This is where we run our script!
get_love_interest
