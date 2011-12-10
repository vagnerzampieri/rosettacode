require 'test/unit'

APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, 'lib'))
require 'guide'

class GuideTest < Test::Unit::TestCase
  def test_load
    puts "Load"
  end
end
