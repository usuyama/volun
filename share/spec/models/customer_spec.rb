require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt",
      :organization_name => "value for organization_name",
      :address => "value for address",
      :email => "value for email",
      :person_in_charge => "value for person_in_charge"
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end
end
