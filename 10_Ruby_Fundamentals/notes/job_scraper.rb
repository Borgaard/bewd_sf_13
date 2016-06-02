require 'pry'
require 'pry-byebug'
require 'mechanize'
require_relative 'job'
require 'csv'

#create an instance of mechanize
def scrape_connect
  Mechanize.new
end

def query_results(form_values)
  form_values.submit
end

def scrape_it(url,position)
  scrape_connect.history_added = Proc.new { sleep 20.0}

  scrape_connect.get(url) do |page|
    form_values = page.form_with(id: 'searchform') do |s|
      s["query"] = position
    end
    query_results(form_values)
  end
end

### Provide query_name, price range and url
url = 'https://sfbay.craigslist.org/search/sfc/jjj'
position = "software engineer"
scrape_it(url,position)
