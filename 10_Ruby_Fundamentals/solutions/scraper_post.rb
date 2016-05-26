require 'pry'
require 'pry-byebug'
require 'mechanize'
require_relative 'apartment'
require 'csv'

#create an instance of mechanize
def scrape_connect
  Mechanize.new
end

#submit values to form and return raw_results
def search_results(form_values)
  results = form_values.submit
  results.search('p.row')
end

def scrape_it(url,name,max_price,min_price)
  scrape_connect.history_added = Proc.new { sleep 4.0}
  #this will be called every 4 seconds
  scrape_connect.get(url) do |search_page|
    form_values = search_page.form_with(id: 'searchform') do |s|
      s['query'] = name
      s['min_price'] = min_price.to_i
      s['max_price'] = max_price.to_i
    end
    raw_results = search_results(form_values)
    parse_results(raw_results)
  end
end

#iterate thru listings, create instance of apartment, shovel it into a results array
def parse_results(raw_results)
  results = []
  results << ['Name', 'URL', 'Price', 'Neighborhood']

  raw_results.each do |result|
    link = result.css('a')[1] #mechanize library
    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    neighborhood = result.search('span.pnr').text[3..-13]

    puts "This apartment is located in #{neighborhood}"

    a = Apartment.new(name,url,price,neighborhood)

    results << [a.name, a.url, a.price, a.neighborhood]
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

### Provide query_name, price range and url
url = 'http://sfbay.craigslist.org/search/eby/apa'
name = "Loft"
min_price = 1000
max_price = 6000

scrape_it(url,name,max_price,min_price)
