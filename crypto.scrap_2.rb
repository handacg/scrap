require 'nokogiri'   
require 'open-uri'

def coinbase
	count = 1
	array = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.css('tbody>tr').each do |row|
		hash = {}
		hash['currency'] = row.css(".currency-name")[0]['data-sort'] # KEY = VALUE //.(classe) #(id) rien(balise) 
		hash['price'] = row.css(".text-right")[1]['data-sort']
		puts "scrapping en cours : #{count}"
		count += 1
		array << hash
	end 
	array
end

puts coinbase
	
