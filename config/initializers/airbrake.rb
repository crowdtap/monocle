Airbrake.configure do |config|
  config.api_key = '88be72f248c63cf46aeedecbc2bb75f4'
  config.user_information = false
  config.development_environments = %w(development test performance staging)
end
