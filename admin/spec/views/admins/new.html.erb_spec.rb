require 'spec_helper'

describe "/admins/new.html.erb" do
  include AdminsHelper

  before(:each) do
    assigns[:admin] = stub_model(Admin,
      :new_record? => true,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt"
    )
  end

  it "renders new admin form" do
    render

    response.should have_tag("form[action=?][method=post]", admins_path) do
      with_tag("input#admin_name[name=?]", "admin[name]")
      with_tag("input#admin_password_hash[name=?]", "admin[password_hash]")
      with_tag("input#admin_password_salt[name=?]", "admin[password_salt]")
    end
  end
end
