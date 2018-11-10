require 'minitest/autorun'
require './rotate_array'

describe "#rotate_array" do
  it "returns 10 elements starting with position 0" do
    rotate_array.must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "returns 7 elements starting with position 3" do
    rotate_array(3, 7).must_equal [5, 6, 7, 1, 2, 3, 4]
  end
end