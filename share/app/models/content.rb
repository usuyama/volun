# -*- coding: utf-8 -*-
require 'rubygems'
require 'RedCloth'

class Content < ActiveRecord::Base

  belongs_to :customer
  has_one :banner_image
  has_many :content_images, :dependent => :destroy
  has_many :users, :through => :appliers
  has_many :classifications
  has_many :tags, :through => :classifications

  validates_presence_of :title,:customer_id, :body, :summary,:message =>"未記入の項目があります"
  validates_numericality_of :banner_size_id,:customer_id

  has_attached_file :banner, :styles => { :small => "360x240>", :medium => "360x480>", :large => "720x480>" },
                    :url  => "/assets/banner/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/banner/:id/:style/:basename.:extension"
  after_update :save_content_images
  before_save :convert_textile

  def content_image_attributes=(content_image_attributes)
    content_image_attributes.each do |attributes|
      content_images.build(attributes)
    end
  end
  def save_content_images
    content_images.each do |content_image|
      content_image.save(false)
    end
  end


  def convert_textile
    self.body_html = RedCloth.new(self.body).to_html
    self.summary_html = RedCloth.new(self.summary).to_html
  end

  named_scope :in_tag, lambda{|tags|
    { :joins => [:classifications],
      :conditions => ["tag_id IN (?) ",tags]
    }
  }
  named_scope :display, {:conditions => {:display => true}}
  named_scope :display_permit, {:conditions => {:display_permit => true}}
      
end
