class CreateContentsTags < ActiveRecord::Migration
  def self.up
    create_table :contents_tags do |t|
      t.string     :content_id
      t.string     :tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :contents_tags
  end
end
