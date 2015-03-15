p "open-uri ========================"

require 'open-uri'

page = open('https://pragprog.com/titles/ruby3/programming-ruby-1-9').read

if page =~ %r{<title>(.*?)</title>}m
  puts "Title is #{$1.inspect}"
end

p "nokogiri ========================"
require 'nokogiri'

doc = Nokogiri::HTML(open('https://pragprog.com/'))

puts 'Page title is ' + doc.xpath('//title').inner_html

puts doc.css('div#copyright p')

puts "\nSecond hyperlink is"
puts doc.xpath('id("site-links")//a[2]')
puts doc.css('#site-links a:nth-of-type(2)')
