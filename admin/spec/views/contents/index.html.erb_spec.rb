require 'spec_helper'

describe "/contents/index.html.erb" do
  include ContentsHelper

  before(:each) do
    assigns[:contents] = [
      stub_model(Content,
        :title => "value for title",
        :body => "value for body",
        :display => false,
        :banner_id => 1,
        :type => "value for type",
        :customer_id => 1,
        :banner_size_id => 1
      ),
      stub_model(Content,
        :title => "value for title",
        :body => "value for body",
        :display => false,
        :banner_id => 1,
        :type => "value for type",
        :customer_id => 1,
        :banner_size_id => 1
      )
    ]
  end

  it "renders a list of contents" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
