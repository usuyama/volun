require 'spec_helper'

describe Content do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body",
      :display => false,
      :banner_id => 1,
      :type => "value for type",
      :customer_id => 1,
      :banner_size_id => 1,
      :publish_at => Time.now,
      :close_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Content.create!(@valid_attributes)
  end
end
