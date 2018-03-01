ENV['XDG_CONFIG_HOME'] ||= File.expand_path('Gemfile', __FILE__)

require 'bundler'
Bundler.require

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require './app/monocle.rb'

if ENV['RACK_ENV'] == 'production'
  Raven.configure do |config|
    config.dsn = 'https://99b9113b8e334b07ad944209d3cd26da:60f24e5aeffd4431a76bb4da563809b2@app.getsentry.com/31772'
  end
end
use Raven::Rack
use Rack::Health, :path => "/health",
                  :body => lambda { |healthy|
                    {
                      :in_rotation => healthy,
                      :revision    => ::File.exists?('REVISION')? ::File.read('REVISION').chomp : 'n/a'
                    }.to_json
                  }

run Monocle.new
