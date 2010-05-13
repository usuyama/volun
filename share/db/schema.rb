# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100513050708) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "appliers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banner_sizes", :force => true do |t|
    t.integer  "height"
    t.integer  "width"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.integer  "content_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.boolean  "display"
    t.integer  "banner_id"
    t.boolean  "content_type"
    t.integer  "customer_id"
    t.integer  "banner_size_id"
    t.datetime "publish_at"
    t.datetime "close_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_image_file_name"
    t.string   "content_image_content_type"
    t.integer  "content_image_file_size"
    t.datetime "content_image_updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "salt"
    t.string   "organization_name"
    t.string   "address"
    t.string   "email"
    t.string   "person_in_charge"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "crypted_password",          :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
