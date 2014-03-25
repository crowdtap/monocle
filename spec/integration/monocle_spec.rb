require 'spec_helper'

describe Monocle do
  include Rack::Test::Methods

  def app
    Monocle.new
  end

  describe "optimized_thumb" do
    it "returns 404 if the image doesn't exist" do

    end
  end
end
