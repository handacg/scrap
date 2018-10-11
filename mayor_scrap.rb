require 'rubygems'
require 'nokogiri'   
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage (webpage)
	page = Nokogiri::HTML(open(webpage))
	return page.css("td")[7].text
end

def get_all_the_urls_of_val_doise_townhalls 
  hash = {}
  count = 1
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  page.css("a.lientxt").each do |x|
    hash[x.text] = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/#{x['href']}")
    puts "scrapping en cours : #{count}"
    count += 1
  end
  hash
end

puts get_all_the_urls_of_val_doise_townhalls

