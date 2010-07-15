class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :category
      t.text :body
      t.string :email
      t.string :name
      t.integer :content_id
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
