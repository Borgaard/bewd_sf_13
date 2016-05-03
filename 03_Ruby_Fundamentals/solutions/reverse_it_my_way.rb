require 'pry'

def my_reverse(string)
  char = string.downcase.chars #transform string into array of character
  word = "" #create an empty string for new word
  until char.length == 0
    word << char.pop #removes last element in array && returns letter
  end
  word #this is what will be returned because it's the last line
end

def is_palindrome?(word)
  if word.downcase == my_reverse(word).downcase
    "YES!! Palindrome!!"
  else
    "Awww. Not quite a Palindrome"
  end
end

 puts "Give me word \n"
 word = gets.strip
 puts is_palindrome?(word)
