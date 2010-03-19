class CreateBannerSizes < ActiveRecord::Migration
  def self.up
    create_table :banner_sizes do |t|
      t.integer :height
      t.integer :width
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :banner_sizes
  end
end
