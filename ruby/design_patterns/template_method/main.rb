# frozen_string_literal: true

# This code snippet demonstrates the use of the Template Method design pattern in Ruby.
# Is a behavioral design pattern that defines the skeleton of an algorithm in a method, deferring some steps to subclasses.
# It lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.
# It's like INHERITANCE.
#
# references:
# https://refactoring.guru/design-patterns/template-method
# https://www.youtube.com/watch?v=j5fGTi8ObK4

require_relative 'doc_data_miner'
require_relative 'pdf_data_miner'
require_relative 'csv_data_miner'

DocDataMiner.new.mine('path/to/doc/file')
PdfDataMiner.new.mine('path/to/pdf/file')
CsvDataMiner.new.mine('path/to/csv/file')

