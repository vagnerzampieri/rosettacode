require 'open-uri'

page = open('https://pragprog.com/titles/ruby3/programming-ruby-1-9').read

if page =~ %r{<title>(.*?)</title>}m
  puts "Title is #{$1.inspect}"
end
