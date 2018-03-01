require 'dogapi'
require 'ddtrace'

$dog = Dogapi::Client.new(ENV['DATADOG_API_KEY'])

