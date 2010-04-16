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

Content.delete_all
10.times do
  Content.create!(:title => Faker::Lorem.words, :body => Faker::Lorem.paragraph)
end
