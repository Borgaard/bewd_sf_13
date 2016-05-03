require 'pry'
require 'pry-byebug'
#add binding.pry anywhere to stop and examine code

def my_reverse(word)
  the_word = word.strip.downcase.chars
end

word = "DoRitos"
puts my_reverse(word)
