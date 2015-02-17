require_relative 'csv_reader'

reader = CsvReader.new

ARGV.each do |filename|
  STDERR.puts "Processing #{filename}"
  reader.read_data(filename)
end

puts "Total value = #{reader.total_value_in_stock}"
