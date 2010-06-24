class BannerSize < ActiveRecord::Base
  has_many :contents

  attr_accessor :name
end
