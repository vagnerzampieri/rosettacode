# frozen_string_literal: true

require_relative 'data_miner'

# The CsvDataMiner class is a concrete implementation of the DataMiner class.
# It provides specific implementations for the abstract methods defined in the DataMiner class.
# This class is responsible for mining data from CSV files.
#
# The `mine` method orchestrates the steps of the data mining process, which includes:
# 1. Opening a CSV file
# 2. Extracting data from the file
# 3. Parsing the extracted data
# 4. Analyzing the parsed data
# 5. Sending a report based on the analysis
#
class CsvDataMiner < DataMiner
  def open_file(path)
    puts "Opening CSV file: #{path}"
    'CSV file content'
  end

  def extract_data(file_content)
    puts "Extracting data from CSV file: #{file_content}"
    'raw data from CSV file'
  end

  def parse_data(raw_data)
    puts "Parsing data: #{raw_data}"
    'parsed data from CSV file'
  end
end
