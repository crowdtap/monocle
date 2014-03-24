ENV["RACK_ENV"] ||= 'test'
require 'rspec'

RSpec.configure do |config|
  config.color_enabled = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
