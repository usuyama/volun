class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.boolean :display
      t.boolean :display_permit
      t.boolean :content_type 
      t.integer :customer_id
      t.integer :banner_size_id
      t.datetime :publish_at
      t.datetime :close_at

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
