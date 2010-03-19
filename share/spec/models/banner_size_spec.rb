require 'spec_helper'

describe BannerSize do
  before(:each) do
    @valid_attributes = {
      :height => 1,
      :width => 1,
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    BannerSize.create!(@valid_attributes)
  end
end
