class BookInStock
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end
end

p b1 = BookInStock.new('isbn1', 3)
p b2 = BookInStock.new('isbn2', 3.14)
p b3 = BookInStock.new('isbn3', '5.67')
