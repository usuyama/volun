require 'spec_helper'

describe "/content_images/new.html.erb" do
  include ContentImagesHelper

  before(:each) do
    assigns[:content_image] = stub_model(ContentImage,
      :new_record? => true
    )
  end

  it "renders new content_image form" do
    render

    response.should have_tag("form[action=?][method=post]", content_images_path) do
    end
  end
end
