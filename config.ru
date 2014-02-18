require 'bundler'
Bundler.require

require 'new_relic/rack/agent_hooks'
require 'new_relic/rack/error_collector'

use NewRelic::Rack::AgentHooks
use NewRelic::Rack::ErrorCollector

Honeybadger.configure do |config|
  config.api_key = 'c6971908'
end
use Honeybadger::Rack
use Rack::Health, :path => "/health", :body => lambda {|healthy| %Q({ "in_rotation": #{healthy}, "revision": "#{::File.exists?('REVISION')? ::File.read('REVISION').chomp : 'n/a'}" }) }

map "/transform_image" do
  run Magickly::App
end
