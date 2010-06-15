# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

BannerSize.delete_all
[['small', 1, 1], ['medium', 2, 1], ['large', 2, 2]].each do |array|
  BannerSize.create!(:name   => array[0], 
                     :height => array[1],
                     :width  => array[2])
end

Tag.delete_all
Tag.create!(:name => "観光施設", :icon_file_name => "btn_tatemono.jpg", :icon_content_type => "image/jpeg", :icon_file_size => 7441)
Tag.create!(:name => "温泉", :icon_file_name => "btn_onsen.jpg", :icon_content_type => "image/jpeg", :icon_file_size => 7909)
Tag.create!(:name => "スポーツ", :icon_file_name => "btn_dash.jpg", :icon_content_type => "image/jpeg", :icon_file_size => 6779)
Tag.create!(:name => "海水浴場", :icon_file_name => "btn_sea.jpg", :icon_content_type => "image/jpeg", :icon_file_size => 6157)
Tag.create!(:name => "お祭り", :icon_file_name => "btn_uchiwa.jpg", :icon_content_type => "image/jpeg", :icon_file_size => 6729)

[Admin, Customer, User].each do |classname|
  classname.delete_all
  classname.create!(:login => "#{classname.to_s.downcase}", :password => "password", :password_confirmation => "password", :email => "#{classname.to_s.downcase}@realglobe.jp")
end

Customer.create!(:login => "furumi", :email => "furumi@realglobe.jp", :organization_name => "Realglobe", :address => "Yokohama", :password => "password", :password_confirmation => "password", :person_in_charge => "genki")
Customer.create!(:login => "usuyama", :email => "usuyama@realglobe.jp", :organization_name => "Realglobe", :address => "Nedu", :password => "password", :password_confirmation => "password", :person_in_charge => "naoto")

Content.delete_all
Content.create!(:title => "test1", :body => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n", :display => true, :display_permit => true, :content_type => true, :customer_id => 1, :banner_size_id => 1, :banner_size_id => 1, :banner_file_name => "034_1.jpg", :banner_content_type => "image/jpeg", :banner_file_size => 362814, :summary => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n")
Content.create!(:title => "test2", :body => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n", :display => true, :display_permit => true, :content_type => true, :customer_id => 1, :banner_size_id => 1, :banner_size_id => 1, :banner_file_name => "033_1.jpg", :banner_content_type => "image/jpeg", :banner_file_size => 203495, :summary => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n")
Content.create!(:title => "test3", :body => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n", :display => true, :display_permit => true, :content_type => true, :customer_id => 1, :banner_size_id => 1, :banner_size_id => 1, :banner_file_name => "026_1.jpg", :banner_content_type => "image/jpeg", :banner_file_size => 270972, :summary => "h1. Give RedCloth a try!\r\n\r\nA *simple* paragraph with\r\na line break, some _emphasis_ and a \"link\":http://redcloth.org\r\n\r\n* an item\r\n* and another\r\n\r\n# one\r\n# two\r\n")


Classification.delete_all
Classification.create!(:content_id => 0, :tag_id => 0)
Classification.create!(:content_id => 1, :tag_id => 1)
Classification.create!(:content_id => 2, :tag_id => 1)









