require 'nokogiri'   
require 'open-uri'


def email
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/damien-abad"))
	return page.xpath("/html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a").text
end


def deputy
	array =[]
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/depute"))
	page.css("td>a").each do |x|
		hash[x] = email("https://www.nosdeputes.fr/#{x['href']}")
 end
  deputy
end

puts deputy




