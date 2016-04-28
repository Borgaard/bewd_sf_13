greeting = "Hey Girl, Hey!"
name = "Kisha"
last_name = "Richardson"
bewd_class = "Back End Web Development        "

#length determine the number characters in string
puts "#{name} has #{name.length} characters"

#strip removed white space
puts "I stripped this #{bewd_class.strip}"

#prepend adds characters to the beginning of a string

puts "I added The to this #{name.prepend("The ")}"

#<< adds characters to the end of a string
name_2 = name << " Cool"
puts "I prepended cool to this #{name_2}"

#chars creates an array of characters from the string
puts "This is my last name as an array #{last_name.chars}. This is of class #{last_name.chars.class}"
