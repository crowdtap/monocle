Monocle::Application.routes.draw do
  mount Magickly::App, :at => '/transform_image'
  mount HealthCheck::Engine => "/health"
end
