require 'spec_helper'

describe "/admins/show.html.erb" do
  include AdminsHelper
  before(:each) do
    assigns[:admin] = @admin = stub_model(Admin,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ password_hash/)
    response.should have_text(/value\ for\ password_salt/)
  end
end
