require 'spec_helper'

describe Applier do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :content_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Applier.create!(@valid_attributes)
  end
end
