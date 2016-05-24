require 'mechanize'
require 'csv'
<<<<<<< HEAD
require 'apartment'
=======
require 'pry-byebug'
require_relative 'apartment'

def scrape_connect
  Mechanize.new
end

def search_results(form)
  page = form.submit
  raw_results = page.search('p.row')
  return raw_results
end

def scrape_it(url,query_name,max_price,min_price)
  scrape_connect.history_added = Proc.new { sleep 5.0} #prevents lock_out

  scrape_connect.get(url) do |search_page|
    form = search_page.form_with(id: 'searchform') do |search|
      search['query'] = query_name
      search['min_price'] = min_price.to_i
      search['max_price'] = max_price.to_i
    end
    raw_results = search_results(form)
    parse_results(raw_results)
  end
end


def parse_results(raw_results)
  results = []
  results << ['Name', 'URL', 'Price', 'Neighborhood']

  raw_results.each do |result|
    link = result.css('a')[1]

    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    neighborhood = result.search('span.pnr').text[3..-13]

    puts "This apartment is located in #{neighborhood}"
    apartment = Apartment.new(name,url,price,neighborhood)
    results << [apartment.name, apartment.url, apartment.price, apartment.neighborhood]

    create_csv(results)
  end
end

def create_csv(results)
  CSV.open("apartment_list.csv", "w+") do |csv_file|
    results.each do |row|
      csv_file << row
    end
  end
end
>>>>>>> 94deb58b44f79b19c895cafd9592b7b9c62e5494


#Provide Dynamic search & url info
url = 'http://sfbay.craigslist.org/search/sfc/apa'
query_name = "Loft"
min_price = 1000
max_price = 5000

<<<<<<< HEAD
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
=======
#Run Script
scrape_it(url,query_name,max_price,min_price)
>>>>>>> 94deb58b44f79b19c895cafd9592b7b9c62e5494
