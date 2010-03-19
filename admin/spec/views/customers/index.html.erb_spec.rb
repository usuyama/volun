require 'spec_helper'

describe "/customers/index.html.erb" do
  include CustomersHelper

  before(:each) do
    assigns[:customers] = [
      stub_model(Customer,
        :name => "value for name",
        :password_hash => "value for password_hash",
        :password_salt => "value for password_salt",
        :organization_name => "value for organization_name",
        :address => "value for address",
        :email => "value for email",
        :person_in_charge => "value for person_in_charge"
      ),
      stub_model(Customer,
        :name => "value for name",
        :password_hash => "value for password_hash",
        :password_salt => "value for password_salt",
        :organization_name => "value for organization_name",
        :address => "value for address",
        :email => "value for email",
        :person_in_charge => "value for person_in_charge"
      )
    ]
  end

  it "renders a list of customers" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for password_hash".to_s, 2)
    response.should have_tag("tr>td", "value for password_salt".to_s, 2)
    response.should have_tag("tr>td", "value for organization_name".to_s, 2)
    response.should have_tag("tr>td", "value for address".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for person_in_charge".to_s, 2)
  end
end
