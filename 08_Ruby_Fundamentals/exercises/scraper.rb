require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require 'apartment'

#Goal:
   #1) Find apartment listings section of craigslist using the 'mechanize' gem
       #a Use the existing form's 'query', 'min_price' and 'max_price' to trigger queries.
       #b Return the title, url, price and location for each listing
   #2)  Save the results to a CSV file using Ruby's 'csv' library
   #3) Use OOP, DRY and 'Brick By Brick' principles to build your script
       #Using the apartment.rb file to create an instance of each

#sample_apartment_url 'http://sfbay.craiglist.org/search/sfc/apa'

#searchform -> querybox -> <input type="text" placeholder="search apartments / housing rentals" name="query" id="query" value="" autocorrect="off" autocapitalize="off" autocomplete="off" data-autocomplete="search" class="flatinput ui-autocomplete-input">

#<input type="tel" name="min_price" class="flatinput min" placeholder="min" title="whole number, no letters or symbols" value="">


def scrape(url)
  scrape = Mechanize.new
  scraper = scrape.history_added = Proc.new { sleep 1.0 }
  scraper.get(url) do |page|
    #finding all data within searchform area of the view layer
    form = page.form_with(id: 'searchform') do |s|
      #assigning new values to query, min_price, and max_price
      s['query'] = "Loft" #name
      s['min_price'] = 1000
      s['max_price'] = 2000
    end
    #submitting search request with above values and returning results
    data = form.submit
    data_search_results(data)
  end
end

#identifying/zeroing in on specific html element pattern to return
def data_search_results(data)
  results = data.search('p.row')
  results.each do |listing|
    create_apartment(listing)
  end
end

def create_apartment(listing)
  price = listing.search('span.price').text
  neighborhood = listing.search('span.pnr').text #need to clean up
  # url = listing.search('a').text
  url = listing.css('a')[1].attributes["href"].values #just the endpoint, get full url
  name = listing.search('span.pl').text.strip #need to clean up
  Apartment.new(price,neighborhood,name,url) #make this work!
end

url = 'https://sfbay.craigslist.org/search/sfc/apa'
scrape(url)

#[9] pry(main)> s.fields[0].name
#=> "query"
#[4] pry(main)> listing.search('span.price').text
# => "$1200"

=begin
create apartment class
create instances of apartments
load into csv file
update url for each instance of apartment
