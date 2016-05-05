require 'pry'

def test_switch(stuff)
  case stuff
  when stuff.include?("e")
    puts "hello"
  when stuff.include?("test")
    puts "goodbye"
  else
    puts "nothing"
  end
end
