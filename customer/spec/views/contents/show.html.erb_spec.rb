require 'spec_helper'

describe "/contents/show.html.erb" do
  include ContentsHelper
  before(:each) do
    assigns[:content] = @content = stub_model(Content,
      :title => "value for title",
      :body => "value for body",
      :display => false,
      :banner_id => 1,
      :type => "value for type",
      :customer_id => 1,
      :banner_size_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/false/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ type/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
