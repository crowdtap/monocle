Airbrake.configure do |config|
  config.api_key                  = '39b098ef4e3f7ccacc9b5d00b3a1ee61'
  config.development_environments = %w(development test cucumber performance staging local_test)

  config.ignore_user_agent << /Googlebot/ << /bitlybot/

  config.ignore.concat([
    'BitlyOAuth::Error',
    'Errno::ENETUNREACH',
    'IOError',
    'Member::ConnectionNotAvailableError',
    'Mongoid::Errors::Validations',
    'Moped::Errors::OperationFailure', # usually from a duplicate on an index
    'OAuth2::Error',
    'OpenSSL::SSL::SSLError',
    'OpenURI::HTTPError',
    'Redis::TimeoutError',
    'SocialMedia::Connection::FacebookConnection::FacebookConnectionError',
  ])
end
