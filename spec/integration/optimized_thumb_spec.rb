require 'spec_helper'

describe Monocle do
  include Rack::Test::Methods

  def app
    Monocle.new
  end

  describe "optimized_thumb" do
    it "returns 404 if the image doesn't exist" do
      stub_request(:get, 'http://www.example.com/images/logo.jpg')
        .to_return(
           :status => 404,
           :body => '',
           :headers => {}
        )
      get '/transform_image/q/src/http%3A%2F%2Fwww.example.com%2Fimages%2Flogo.jpg/optimized_thumb/200x100'
      last_response.status.should == 404
    end

    it "returns 200 if the image exists" do
      stub_request(:get, 'http://www.example.com/images/logo.jpg')
        .to_return(
           :status => 200,
           :body => File.read('spec/fixtures/crowdtap-logo.jpg'),
           :headers => {}
        )
      get '/transform_image/q/src/http%3A%2F%2Fwww.example.com%2Fimages%2Flogo.jpg/optimized_thumb/200x100'
      last_response.status.should == 200
    end
  end
end
