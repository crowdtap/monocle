require 'spec_helper'
require 'app/monocle'

describe "optmized_thumb" do
  let(:app) { ->(env) { [200, env, "app"] } }
  let :middleware do
    Monocle.new(app)
  end

  it "returns 404 if the image doesn't exist" do

  end
end
