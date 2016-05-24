require 'pry'
require 'pry-byebug'

class Apartment
  attr_accessor :name, :url, :price, :neighborhood

  def initialize(name,url,price,neighborhood)
    @name = name
    @url = url
    @price = price
    @neighborhood = neighborhood
  end
end
