require 'spec_helper'

describe "/content_images/show.html.erb" do
  include ContentImagesHelper
  before(:each) do
    assigns[:content_image] = @content_image = stub_model(ContentImage)
  end

  it "renders attributes in <p>" do
    render
  end
end
