require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'

#Goal:
   #1) Find apartment listings section of craigslist using the 'mechanize' gem
       #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
       #b Return the title, url, price and location for each listing
   #2)  Save the results to a CSV file using Ruby's 'csv' library
   #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
       #Using the apartment.rb file to create an instance of each

#sample_apartment_url 'http://sfbay.craiglist.org/search/sfc/apa'

scraper = Mechanize.new
scraper.history_added = Proc.new { sleep 1.0 }
