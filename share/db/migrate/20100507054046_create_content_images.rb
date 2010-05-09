class CreateContentImages < ActiveRecord::Migration
  def self.up
    create_table :content_images do |t|
      t.integer :content_id
      t.string :content_image_file_name
      t.string :content_image_content_type
      t.integer :content_image_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :content_images
  end
end
