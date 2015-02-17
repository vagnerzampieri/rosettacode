require 'csv'
require_relative 'book_in_stock'

class CsvReader
  def initialize
    @books_in_stock = []
  end

  def read_data(filename)
    CSV.foreach(filename, headers: true) do |row|
      @books_in_stock << BookInStock.new(row['ISBN'], row['Price'])
    end
  end

  def total_value_in_stock
    sum = 0.0
    @books_in_stock.map {|book| sum += book.price}.last
  end

  def number_of_each_isbn
  end
end
