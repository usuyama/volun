require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt",
      :email => "value for email"
    )
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_name[name=?]', "user[name]")
      with_tag('input#user_password_hash[name=?]', "user[password_hash]")
      with_tag('input#user_password_salt[name=?]', "user[password_salt]")
      with_tag('input#user_email[name=?]', "user[email]")
    end
  end
end
