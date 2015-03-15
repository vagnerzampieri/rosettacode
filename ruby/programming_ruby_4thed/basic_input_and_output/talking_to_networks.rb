require 'net/http'

p 'With net/http =========='
uri = URI('https://pragprog.com/book/ruby3/programming-ruby-1-9')
response = Net::HTTP.get_response(uri)

p response

if response.is_a?(Net::HTTPOK)
  puts response.body.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end

require 'open-uri'

p 'With open-uri =========='
open('https://pragprog.com') do |f|
  puts f.read.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end
