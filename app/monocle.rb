require 'rack'

class Monocle
  def call(env)
    Magickly.dragonfly.configure do |config|
      config.job :optimized_thumb do |geometry, format|
        begin
          process :thumb, geometry
          encode format if format
          image_optim = ImageOptim.new(:pngout => false, :svgo => false)
          image_optim.optimize_image!(@job.path)
        rescue Dragonfly::DataStorage::DataNotFound
        end
      end
    end
    Magickly::App.call(env)
  end
end
