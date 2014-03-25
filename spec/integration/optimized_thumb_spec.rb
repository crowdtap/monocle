require 'spec_helper'

describe Monocle do
  include Rack::Test::Methods

  def app
    Monocle.new
  end

  describe "optimized_thumb" do
    it "returns 404 if the image doesn't exist" do
      get '/transform_image/q/src/http%3A%2F%2Flocalhost%2F.jpg/optimized_thumb/200x100'
      last_response.status.should == 404
    end
  end
end
