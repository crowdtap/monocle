require 'rack'

class Monocle
  def initialize
    configure_errors
    configure_jobs

    @app = Rack::Builder.new do
      map "/transform_image" do
        run Magickly::App
      end
    end
  end

  def call(env)
    begin
      @app.call(env)
    rescue ArgumentError => e
      if e.message == "invalid base64"
        if env["PATH_INFO"].match('%0D%0A')
          env["PATH_INFO"].gsub!('%0D%0A', '')
        else
          env["PATH_INFO"] = "#{env["PATH_INFO"]}="
        end
        puts env["PATH_INFO"]
        @app.call(env)
      else
        raise e
      end
    end
  end

  private
  def configure_errors
    Magickly::App.configure do |config|
      config.error Addressable::URI::InvalidURIError do
        404
      end
    end
  end

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
