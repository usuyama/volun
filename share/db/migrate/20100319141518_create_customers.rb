class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :password_hash
      t.string :password_salt
      t.string :organization_name
      t.string :address
      t.string :email
      t.string :person_in_charge

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
