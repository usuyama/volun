class CreateContentImages < ActiveRecord::Migration
  def self.up
    create_table :content_images do |t|
      t.references :content
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.timestamps
    end
    add_index :content_images, :content_id
  end

  def self.down
    drop_table :content_images
  end
end
