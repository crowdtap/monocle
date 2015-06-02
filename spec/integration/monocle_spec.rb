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
           :status  => 404,
           :body    => '',
           :headers => {}
        )
      get '/transform_image/q/src/http%3A%2F%2Fwww.example.com%2Fimages%2Flogo.jpg/optimized_thumb/200x100'
      last_response.status.should == 404
    end

    it "returns 404 if the image isn't a url" do
      get '/transform_image/q/src/undefined/optimized_thumb/200x100'
      last_response.status.should == 404

      get 'transform_image/qe/c3JjL3VuZGVmaW5lZC9vcHRpbWl6ZWRfdGh1bWIvMjR4MjRe'
      last_response.status.should == 404
    end

    it "returns 200 if the image exists" do
      stub_request(:get, 'http://www.example.com/images/logo.jpg')
        .to_return(
           :status  => 200,
           :body    => File.read('spec/fixtures/crowdtap-logo.jpg'),
           :headers => {}
        )
      get '/transform_image/q/src/http%3A%2F%2Fwww.example.com%2Fimages%2Flogo.jpg/optimized_thumb/200x100'
      last_response.status.should == 200
    end

  end

  describe "fixing invalid base64" do
    before do
      stub_request(:get, 'http://www.example.com/images/logo.jpg')
        .to_return(
           :status  => 200,
           :body    => File.read('spec/fixtures/crowdtap-logo.jpg'),
           :headers => {}
        )
    end

    it "fixes base64 when resizing an image" do
      get 'transform_image/qe/c3JjL2h0dHAlM0ElMkYlMkZ3d3cuZXhhbXBsZS5jb20lMkZpbWFnZXMlMkZsb2dvLmpwZy9vcHRpbWl6ZWRfdGh1bWIvMjAweDEwMC9hcHAvY3Jvd2R0YXA'
      last_response.status.should == 200
    end

    it "fixes base64 when not modifying an image" do
      get 'transform_image/qe/c3JjL2h0dHAlM0ElMkYlMkZ3d3cuZXhhbXBsZS5jb20lMkZpbWFnZXMlMkZsb2dvLmpwZy9hcHAvY3Jvd2R0YXA'
      last_response.status.should == 200
    end

    it "fixes base64 with line breaks in it" do
      get 'transform_image/qe/c3JjL2h0dHAlM0ElMkYlMkZ%0D%0A3d3cuZXhhbXBsZS5jb20lMkZpbWFnZXMlMkZsb2dvLmpwZy9hcHAvY3Jvd2R0YXA='
      last_response.status.should == 200
    end
  end
end
