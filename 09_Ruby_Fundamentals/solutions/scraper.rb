require 'mechanize'
require 'csv'
require 'pry-byebug'

def scrape_connect
  Mechanize.new
end

def search_results(form)
  page = form.submit
  page.search('p.row') #results raw_results
end

def scrape_it(url,query_name,max_price,min_price)
  scrape_connect.history_added = Proc.new { sleep 2.0}

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
    link = result.css('a')[1] #mechanize library
    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    neighborhood = result.search('span.pnr').text[3..-13]

    puts "This apartment is located in #{neighborhood}"

    results << [name, url, price, neighborhood]

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


#Provide Dynamic search & url info
url = 'http://sfbay.craigslist.org/search/sfc/apa'
query_name = "Loft"
min_price = 1000
max_price = 5000

#Run Script
scrape_it(url,query_name,max_price,min_price)
