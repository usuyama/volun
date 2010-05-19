# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

begin
  require 'faker'
rescue
  puts "Please install faker with 'sudo gem install faker'"
  exit 1
end

BannerSize.delete_all
[['small', 1, 1], ['medium', 2, 1], ['large', 2, 2]].each do |array|
  BannerSize.create!(:name   => array[0], 
                     :height => array[1],
                     :width  => array[2])
end

Tag.delete_all
["観光施設", "温泉", "スポーツ", "海水浴場", "お祭り"].each do |name|
  Tag.create!(:name => name)
end

[Admin, Customer, User].each do |classname|
  classname.delete_all
  classname.create!(:login => "#{classname.to_s.downcase}", :password => "password", :password_confirmation => "password", :email => "#{classname.to_s.downcase}@realglobe.jp")
end

Content.delete_all
Tag.all.each do |tag|
  rand(6).times do
    id = Content.create!(:title => Faker::Lorem.words(rand(3)+1).join(" "),
                         :body => Faker::Lorem.paragraphs.to_s,
                         :display => true,
                         :content_type => "article",
                         :customer_id => Customer.first.id,
                         :banner_size_id => BannerSize.all.rand.id,
                         :publish_at => Time.now,
                         :close_at => Time.now + 1.year).id
    Classification.create!(:tag_id => tag.id, :content_id => id)
  end
end

