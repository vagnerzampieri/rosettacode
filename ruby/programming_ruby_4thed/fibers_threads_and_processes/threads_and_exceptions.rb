require 'logger'

logger = Logger.new("#{`pwd`.gsub("\n", "")}/logger.log")

threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end

puts "Waiting"
threads.each do |t|
  begin
    t.join
  rescue RuntimeError => e
    puts "Failed: #{e.message}"
    logger.warn("measure=service.threads.runtime_error exception=#{e.to_s}")
  end
end
puts "Done"
