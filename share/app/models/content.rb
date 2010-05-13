class Content < ActiveRecord::Base
  belongs_to :customer
  has_one :banner_image
  has_many :users, :through => :appliers

  has_attached_file :content_image, :styles => { :small => "240x360>" }

  validates_attachment_presence :content_image
  validates_attachment_size :content_image, :less_than => 5.megabytes
  validates_attachment_content_type :content_image, :content_type => ['image/jpeg', 'image/png']
  validates_presence_of :title,:customer_id,:body ,:message =>"未記入の項目があります"
  validates_length_of :title, :in => 5..100, :message =>"長さが不正です"
  validates_length_of :body, :in => 5..1000, :message =>"長さが不正です"
  validates_numericality_of :banner_size_id,:customer_id,:banner_id
  
end
