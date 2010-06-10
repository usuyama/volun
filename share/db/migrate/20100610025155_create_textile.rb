class CreateTextile < ActiveRecord::Migration
  def self.up
    add_column :contents, :summary_html, :text
    add_column :contents, :body_html, :text
  end

  def self.down
    remove_column :contents, :summary_html
    remove_column :contents, :body_html
  end
end
