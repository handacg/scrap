require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage (webpage)
	page = Nokogiri::HTML(open(webpage))
	return = page.css("td")[7].text
	end

def get_all_the_urls_of_val_doise_townhalls 
  hash = {}
  page = Nokogiri::HTML(open(http://annuaire-des-mairies.com/val-d-oise.html))
  page.css("a.lientext").each do |a|
    hash[a.text] = "http://annuaire-des-mairies.com/#{a['href']}"
  end
  return hash
end

def get_all_the_emails_of_val_doise_townhalls 
  all_mails ={}
  hash = get_all_the_urls_of_val_doise_townhalls
  hash.each do |k,v|
  	all_mails[k] = get_the_email_of_a_townhal_from_its_webpage (v)
  end
  return all_emails
end

puts get_all_the_emails_of_val_doise_townhalls