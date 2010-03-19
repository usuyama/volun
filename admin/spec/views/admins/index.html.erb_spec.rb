require 'spec_helper'

describe "/admins/index.html.erb" do
  include AdminsHelper

  before(:each) do
    assigns[:admins] = [
      stub_model(Admin,
        :name => "value for name",
        :password_hash => "value for password_hash",
        :password_salt => "value for password_salt"
      ),
      stub_model(Admin,
        :name => "value for name",
        :password_hash => "value for password_hash",
        :password_salt => "value for password_salt"
      )
    ]
  end

  it "renders a list of admins" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for password_hash".to_s, 2)
    response.should have_tag("tr>td", "value for password_salt".to_s, 2)
  end
end
