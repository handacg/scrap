require 'rubygems'
require 'nokogiri'   
require 'open-uri'
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

page = Nokogiri::HTML(open(PAGE_URL))
puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage