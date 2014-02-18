require 'honeybadger'
require 'magickly'
require 'rack-health'

Honeybadger.configure do |config|
  config.api_key = 'c6971908'
end
use Honeybadger::Rack
use Rack::Health, :path => "/health", :body => lambda {|healthy| %Q({ "in_rotation": #{healthy}, "revision": "#{::File.exists?('REVISION')? ::File.read('REVISION').chomp : 'n/a'}" }) }

map "/transform_image" do
  run Magickly::App
end
