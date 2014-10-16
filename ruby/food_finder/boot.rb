# Load Bundler
require 'rubygems'
require 'bundler/setup'

# Load TestUnit
require 'test/unit'

# Load paths
APP_ROOT = File.dirname(__FILE__)

load_paths = %w[lib test]

load_paths.each do |path|
  $:.unshift(File.join(APP_ROOT, path))
end
