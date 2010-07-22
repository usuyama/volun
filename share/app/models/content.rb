# -*- coding: utf-8 -*-
require 'rubygems'

class Content < ActiveRecord::Base

  belongs_to :customer
  belongs_to :banner_size
  has_many :content_images, :dependent => :destroy
  has_many :users, :through => :appliers
  has_many :classifications
  has_many :tags, :through => :classifications
  has_many :favorites
  has_many :users, :through => :favorites

  validates_presence_of :title,:customer_id, :body, :summary,:message =>"未記入の項目があります"
  validates_numericality_of :banner_size_id,:customer_id

  has_attached_file :banner, :styles => { :small => "320x240\!", :medium => "320x480\!", :large => "640x480\!" },
  :url  => "/assets/banner/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/banner/:id/:style/:basename.:extension"
  after_update :save_content_images

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

  def is_favorite_of?(user)
    users.include?(user)
  end



  
  named_scope :in_tag, lambda{|tags|
    { :joins => [:classifications],
      :conditions => ["tag_id IN (?) ",tags]
    }
  }
  named_scope :displayable, {:conditions => ["(display = ? or content_type = ?) and display_permit = ?", true, true, true]}
  
  named_scope :intime, lambda{{:conditions => ["publish_at < ? and ? < close_at", Time.now,Time.now]}}
  
named_scope :banner_size,lambda{|sizes|
    {:conditions => ["banner_size_id = ?",sizes] }
  }

  define_index do
    set_property :html_strip => true
    indexes body_html
  end

end
