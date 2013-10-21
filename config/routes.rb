Monocle::Application.routes.draw do
  mount Magickly::App       => '/transform_image'
  mount HealthCheck::Engine => '/health'
end
