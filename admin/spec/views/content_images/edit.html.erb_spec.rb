require 'spec_helper'

describe "/content_images/edit.html.erb" do
  include ContentImagesHelper

  before(:each) do
    assigns[:content_image] = @content_image = stub_model(ContentImage,
      :new_record? => false
    )
  end

  it "renders the edit content_image form" do
    render

    response.should have_tag("form[action=#{content_image_path(@content_image)}][method=post]") do
    end
  end
end
