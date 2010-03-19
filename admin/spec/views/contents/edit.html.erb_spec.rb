require 'spec_helper'

describe "/contents/edit.html.erb" do
  include ContentsHelper

  before(:each) do
    assigns[:content] = @content = stub_model(Content,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body",
      :display => false,
      :banner_id => 1,
      :type => "value for type",
      :customer_id => 1,
      :banner_size_id => 1
    )
  end

  it "renders the edit content form" do
    render

    response.should have_tag("form[action=#{content_path(@content)}][method=post]") do
      with_tag('input#content_title[name=?]', "content[title]")
      with_tag('input#content_body[name=?]', "content[body]")
      with_tag('input#content_display[name=?]', "content[display]")
      with_tag('input#content_banner_id[name=?]', "content[banner_id]")
      with_tag('input#content_type[name=?]', "content[type]")
      with_tag('input#content_customer_id[name=?]', "content[customer_id]")
      with_tag('input#content_banner_size_id[name=?]', "content[banner_size_id]")
    end
  end
end
