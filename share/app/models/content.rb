class Content < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :title,:customer_id
  validates_uniqueness_of :customer_id,:id
  validates_numericality_of :id,:banner_size_id,:customer_id,:banner_id
end
