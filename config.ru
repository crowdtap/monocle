require 'bundler'
Bundler.require

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'new_relic/rack/agent_hooks'
require 'new_relic/rack/error_collector'

Honeybadger.configure do |config|
  config.api_key = 'c6971908'
end
use Honeybadger::Rack
use NewRelic::Rack::AgentHooks
use NewRelic::Rack::ErrorCollector
use Rack::Health, :path => "/health",
                  :body => lambda { |healthy|
                    {
                      :in_rotation => healthy,
                      :revision    => ::File.exists?('REVISION')? ::File.read('REVISION').chomp : 'n/a'
                    }.to_json
                  }

Magickly.dragonfly.configure do |config|
  config.job :optimized_thumb do |geometry, format|
    process :thumb, geometry
    encode format if format
    image_optim = ImageOptim.new(:pngout => false, :svgo => false)
    image_optim.optimize_image!(@job.path)
  end
end

map "/transform_image" do
  run Magickly::App
end
