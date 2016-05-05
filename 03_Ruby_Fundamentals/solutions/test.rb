require 'pry'

def test_switch(stuff)
  binding.pry
  case stuff
  when stuff.include?("e")
    puts "hello"
  when stuff.include?("test")
    puts "goodbye"
  else
    puts "nothing"
  end
end

test_switch("jenny")
