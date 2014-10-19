require 'support/number_helper'
class Restaurant
  include NumberHelper

  @@filepath = nil

  def self.filepath=(path = nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  attr_accessor :name, :cuisine, :price

  def self.file_exists?
    # class should know if the restaurant file exists
    true if @@filepath && File.exist?(@@filepath)
    false
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exist?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    true
  end

  def self.create_file
    # create the restaurant file
    File.open(@@filepath, 'w') unless file_exists?
    file_usable?
  end

  def self.saved_restaurants
    # read the restaurant file
    # return instances of restaurant
    restaurants = []
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        restaurants << Restaurant.new.import_line(line.chomp)
      end
      file.close
    end
    restaurants
  end

  def self.build_using_questions
    args = {}
    print 'Restaurant name: '
    args[:name] = gets.chomp.strip

    print 'Cuisine type: '
    args[:cuisine] = gets.chomp.strip

    print 'Average price: '
    args[:price] = gets.chomp.strip

    new(args)
  end

  def initialize(args = {})
    @name     = args[:name] || ''
    @cuisine  = args[:cuisine] || ''
    @price    = args[:price] || ''
  end

  def import_line(line)
    line_array = line.split("\t")
    @name, @cuisine, @price = line_array
    self
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    true
  end

  def formatted_price
    number_to_currency(@price)
  end
end
