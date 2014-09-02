default[:application] = 'monocle'
default[:rubies] = ['2.1.2-github1']

default[:fiance][:url] = 'http://fiance.vpc.crowdtap.com'
default[:monocle][:url] = '//dgj5ep7xp9u24.cloudfront.net'
default[:promiscuous][:amqp_url] = 'amqp://crowdtap:OpTDZCTyVnOqAhOgISXuKiTnjgHGsGYRmOrQWDlpJyXonh@rabbit.vpc.crowdtap.com:5672'
default[:promiscuous][:rabbit_mgmt_url] = 'http://crowdtap:OpTDZCTyVnOqAhOgISXuKiTnjgHGsGYRmOrQWDlpJyXonh@rabbit.vpc.crowdtap.com:15672'
default[:promiscuous][:redis_url] = 'redis://promiscuous.sxc8di.0001.use1.cache.amazonaws.com:6379'
default[:redis][:url] = 'redis://sidekiq.sxc8di.0001.use1.cache.amazonaws.com:6379'
default[:sidekiq][:redis_url] = 'redis://sidekiq.sxc8di.0001.use1.cache.amazonaws.com:6379'
default[:sniper][:url] = 'http://sniper.vpc.crowdtap.com/'
default[:sniper][:notification_url] = 'http://sniper-bg.vpc.crowdtap.com/'
default[:waldo][:url] = 'http://waldo.vpc.crowdtap.com'
