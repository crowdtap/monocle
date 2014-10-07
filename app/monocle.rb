require 'rack'

class Monocle
  def initialize
    configure_jobs

    @app = Rack::Builder.new do
      map "/transform_image" do
        run Magickly::App
      end
    end
  end

  def call(env)
    @app.call(env)
  end

  private
  def configure_jobs
    Magickly.dragonfly.configure do |config|
      config.job :optimize do
        begin
          image_optim = ImageOptim.new(:pngout => false, :svgo => false, :pngcrush => false,
                                       :optipng => { :level => 1 }, :pngquant => { :speed => 11 },
                                       :advpng => { :level => 1 })
          image_optim.optimize_image!(@job.path)
        rescue Dragonfly::DataStorage::DataNotFound
        end
      end

      config.job :optimized_thumb do |geometry, format|
        process :thumb, geometry
        encode format if format

        @job.optimize
      end
    end
  end
end
