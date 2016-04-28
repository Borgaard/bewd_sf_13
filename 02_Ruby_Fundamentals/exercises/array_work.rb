#array_work
cars = ["tesla", "ford", "madza"]
rock_stars = ["Beyonce", "Beatles", "Jay-Z", "Kanye West", "Taylor Swift"]
books = ["Jitterbug Perfume", "Wild Seed", "Infinite Jest"]

#1 - .size determines the number of elements in an my array
puts "There are #{cars.size} cars in my array"

#2
book = "A Tree Grows in Brooklyn"
books.push(book)
puts "I just added #{book} to my book array"
puts "#{books}"

#3 - .pop removes the last element from the array
puts "I just removed #{rock_stars.pop} from rock stars array"

#4 - .unshift adds a elements to the beginning of the array
puts "I just added The Roots to the beginning of our rock stars array"
puts "#{rock_stars.unshift("The Roots")}"

#5 - .shift removes the first element from the array
puts "I just removed the first rock star"
puts "#{rock_stars.shift}"

#6 - .uniq and uniq!
rock_stars.push("Beyonce")
puts "I am only returning unique rock stars #{rock_stars.uniq!}"

#7 - .include?
if rock_stars.include?('Beatles')
  puts "The Beatles are here!"
else
  "nothing"
end
