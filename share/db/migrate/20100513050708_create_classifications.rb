class CreateClassifications < ActiveRecord::Migration
  def self.up
    create_table :classifications do |t|
      t.integer :content_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :classifications
  end
end
