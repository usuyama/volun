class Content < ActiveRecord::Base
  belongs_to :customer
  has_one :banner_image
  has_many :content_images
  has_many :users, :through => :appliers
  has_many :classifications
  has_many :tags, :through => :classifications

  validates_presence_of :title,:customer_id,:body ,:message =>"未記入の項目があります"
  validates_numericality_of :banner_size_id,:customer_id

  has_attached_file :banner, :styles => { :small => "150x150>" },
                    :url  => "/assets/banner/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/banner/:id/:style/:basename.:extension"

  def content_image_attributes=(content_image_attributes)
    content_image_attributes.each do |attributes|
      content_images.build(attributes)
    end
  end
  
end
