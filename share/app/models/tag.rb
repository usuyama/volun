class Tag < ActiveRecord::Base
  has_many :contents, :through => :contents_tags
end
