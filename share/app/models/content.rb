class Content < ActiveRecord::Base
  belongs_to :customer
  has_one :content_image
  has_one :banner_image
  has_many :users, :through => :appliers
  validates_presence_of :title,:customer_id
  validates_numericality_of :banner_size_id,:customer_id,:banner_id
end
