### Food Finder ###
# Launch this Ruby file from the command line to get started.

require File.expand_path('../boot', __FILE__)
require 'guide/guide'

guide = Guide.new('restaurants.txt')
guide.launch!
