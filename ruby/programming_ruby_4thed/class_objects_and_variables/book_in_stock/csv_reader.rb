class CsvReader
  def initialize
    @books_in_stock = []
  end

  def read_data(filename)
    CSV.foreach(filename, headers: true) do |row|
      @books_in_stock << BookInStock.new(row['ISBN'], row['Price'])
    end
  end
end
