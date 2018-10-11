require 'nokogiri'   
require 'open-uri'

def coinbase_name
	name = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.css("td.currency-name").each do |x|
	name << x["data-sort"]
    end 
  name
end
 
def coinbase_value
	value = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.css("a.price").each do |y|
	value << y["data-usd"]
	end
  value
end

def coinbase
	Hash[coinbase_name.zip(coinbase_value)] 
	end

puts coinbase	