require 'spec_helper'

describe "/customers/new.html.erb" do
  include CustomersHelper

  before(:each) do
    assigns[:customer] = stub_model(Customer,
      :new_record? => true,
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt",
      :organization_name => "value for organization_name",
      :address => "value for address",
      :email => "value for email",
      :person_in_charge => "value for person_in_charge"
    )
  end

  it "renders new customer form" do
    render

    response.should have_tag("form[action=?][method=post]", customers_path) do
      with_tag("input#customer_name[name=?]", "customer[name]")
      with_tag("input#customer_password_hash[name=?]", "customer[password_hash]")
      with_tag("input#customer_password_salt[name=?]", "customer[password_salt]")
      with_tag("input#customer_organization_name[name=?]", "customer[organization_name]")
      with_tag("input#customer_address[name=?]", "customer[address]")
      with_tag("input#customer_email[name=?]", "customer[email]")
      with_tag("input#customer_person_in_charge[name=?]", "customer[person_in_charge]")
    end
  end
end
