ENV["RACK_ENV"] ||= 'test'
require 'bundler'
Bundler.require

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rspec'
require 'rack/test'

Dir[File.expand_path('../../app/*.rb', __FILE__)].each do |f|
  require f
end

RSpec.configure do |config|
  config.color_enabled = true
  config.order = "random"
end
