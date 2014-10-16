# Load Bundler
require 'rubygems'
require 'bundler/setup'

# Load paths
APP_ROOT = File.dirname(__FILE__)

load_paths = %w[lib spec]

load_paths.each do |path|
  $:.unshift(File.join(APP_ROOT, path))
end
