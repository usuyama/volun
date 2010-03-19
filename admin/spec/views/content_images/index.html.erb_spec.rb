require 'spec_helper'

describe "/content_images/index.html.erb" do
  include ContentImagesHelper

  before(:each) do
    assigns[:content_images] = [
      stub_model(ContentImage),
      stub_model(ContentImage)
    ]
  end

  it "renders a list of content_images" do
    render
  end
end
