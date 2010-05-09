# -*- coding: utf-8 -*-
class Content < ActiveRecord::Base
  belongs_to :customer
  has_one :banner_image
  has_many :content_images
  has_many :users, :through => :appliers
  has_many :tags, :through => :contents_tags
  has_attached_file :banner, :styles => { :small => "150x150>" },
                  :url  => "/assets/banner/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/banner/:id/:style/:basename.:extension"

  validates_attachment_presence :banner ,:on => :update
  validates_attachment_size :banner, :less_than => 5.megabytes, :on => :update
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png'], :on => :update
  validates_presence_of :customer_id
  validates_presence_of :title,:body ,:message =>"未記入の項目があります", :on => :update
  validates_length_of :title, :in => 5..100, :message =>"長さが不正です", :on => :update
  validates_length_of :body, :in => 5..1000, :message =>"長さが不正です", :on => :update
  validates_numericality_of :banner_size_id,:customer_id,:banner_id, :on => :update

  def content_image_attributes=(content_image_attributes)
    content_image_attributes.each do |attributes|
      content_images.build(attributes)
    end
  end
  
end
