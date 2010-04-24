class ChangeColumnsInCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :login, :string
    add_column :customers, :crypted_password ,:string, :limit => 40
    add_column :customers, :remember_token, :string
    add_column :customers, :remember_token_expires_at, :datetime
    rename_column :customers, :password_salt ,:salt
    remove_column :customers, :password_hash
    remove_column :customers, :name
  end

  def self.down
    remove_column :login,:customers ,:crypted_password , :remember_token, :remember_token_expires_at
    rename_column :customers, :salt , :password_salt
    add_column :customers, :password_hash , :string
    add_column :customers, :name, :string
  end
end
