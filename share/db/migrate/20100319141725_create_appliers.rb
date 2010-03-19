class CreateAppliers < ActiveRecord::Migration
  def self.up
    create_table :appliers do |t|
      t.integer :user_id
      t.integer :content_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appliers
  end
end
