class CreateBannerSizes < ActiveRecord::Migration
  def self.up
    create_table :banner_sizes do |t|
      t.string :name
      t.integer :height
      t.integer :width
      t.timestamps
    end
  end

  def self.down
    drop_table :banner_sizes
  end
end
