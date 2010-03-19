require 'spec_helper'

describe "/admins/edit.html.erb" do
  include AdminsHelper

  before(:each) do
    assigns[:admin] = @admin = stub_model(Admin,
      :new_record? => false,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt"
    )
  end

  it "renders the edit admin form" do
    render

    response.should have_tag("form[action=#{admin_path(@admin)}][method=post]") do
      with_tag('input#admin_name[name=?]', "admin[name]")
      with_tag('input#admin_password_hash[name=?]', "admin[password_hash]")
      with_tag('input#admin_password_salt[name=?]', "admin[password_salt]")
    end
  end
end
