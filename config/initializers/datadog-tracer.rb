Datadog.configure do |c|
  c.tracer hostname: ENV['APM_HOST'], port: ENV['APM_PORT'], env: Rails.env
  c.use :rails
  c.use :sidekiq
  c.use :redis
end

Rails.configuration.datadog_trace = {
  auto_instrument: true,
  auto_instrument_redis: true,
  default_service: 'Monocle',
  debug: false,
  trace_agent_hostname: ENV['APM_HOST'],
  trace_agent_port: ENV['APM_PORT'],
  env: ENV['RAILS_ENV'],
  tags: {
    environment: ENV['RAILS_ENV']
  }
}
