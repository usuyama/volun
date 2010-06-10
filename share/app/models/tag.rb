class Tag < ActiveRecord::Base
  has_many :classifications
  has_many :contents, :through => :classifications

  has_attached_file :icon 

end
