require 'honeybadger'

Honeybadger.configure do |config|
  config.api_key = 'c6971908'
end
use Honeybadger::Rack

map "/transform_image" do
  run Monocle::Application
end

map "/health" do
  run HealthCheck::Engine
end
