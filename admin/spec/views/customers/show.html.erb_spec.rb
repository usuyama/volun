require 'spec_helper'

describe "/customers/show.html.erb" do
  include CustomersHelper
  before(:each) do
    assigns[:customer] = @customer = stub_model(Customer,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt",
      :organization_name => "value for organization_name",
      :address => "value for address",
      :email => "value for email",
      :person_in_charge => "value for person_in_charge"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ password_hash/)
    response.should have_text(/value\ for\ password_salt/)
    response.should have_text(/value\ for\ organization_name/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ person_in_charge/)
  end
end
