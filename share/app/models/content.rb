class Content < ActiveRecord::Base
  belongs_to :customer
  has_one :content_image
  has_one :banner_image
  has_many :users, :through => :appliers
  
  validates_presence_of :title,:customer_id,:body ,:message =>"未記入の項目があります"
  validates_length_of :title, :in => 5..100, :message =>"長さが不正です"
  validates_length_of :body, :in => 5..1000, :message =>"長さが不正です"
  validates_numericality_of :banner_size_id,:customer_id,:banner_id
  
end
