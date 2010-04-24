class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :login
      t.string :email
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
