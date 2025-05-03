# frozen_string_literal: true

# The DataMiner class is an abstract class that defines the template method `mine`.
# The `mine` method orchestrates the steps of the data mining process, which includes:
# 1. Opening a file
# 2. Extracting data from the file
# 3. Parsing the extracted data
# 4. Analyzing the parsed data
# 5. Sending a report based on the analysis
#
class DataMiner
  class MethodNotImplementedError < StandardError; end

  def mine(path)
    file_content = open_file(path)
    raw_data = extract_data(file_content)
    parsed_data = parse_data(raw_data)
    analysis = analyze_data(parsed_data)
    send_report(analysis)
  end

  protected

  def open_file(_path)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end

  def extract_data(_file_content)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end

  def parse_data(_raw_data)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end

  def analyze_data(parsed_data)
    { analyzed_data: parsed_data }
  end

  def send_report(analysis)
    puts "Sending report... #{analysis}"
  end
end
