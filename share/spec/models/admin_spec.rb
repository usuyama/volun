require 'spec_helper'

describe Admin do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :password_hash => "value for password_hash",
      :password_salt => "value for password_salt"
    }
  end

  it "should create a new instance given valid attributes" do
    Admin.create!(@valid_attributes)
  end
end
