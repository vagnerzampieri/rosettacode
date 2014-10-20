# Load Bundler
require 'rubygems'
require 'bundler/setup'

# Load paths
ENV['APP_ROOT'] = File.dirname(__FILE__)

load_paths = %w[lib spec data]

load_paths.each do |path|
  $:.unshift(File.join(ENV['APP_ROOT'], path))
end
