require 'honeybadger'
require 'magickly'
require 'health_check'

Honeybadger.configure do |config|
  config.api_key = 'c6971908'
end
use Honeybadger::Rack

map "/transform_image" do
  run Magickly::App
end

map "/health" do
  run HealthCheck::Engine
end
