class ContentImage < ActiveRecord::Base
  belongs_to :content
  has_attached_file :data,
                  :url  => "/assets/content_images/:id/:basename.:extension",
  :path => ":rails_root/public/assets/content_images/:id/:basename.:extension"
  def self.destroy_pics(content, content_images)
    ContentImage.find(content_images, :conditions => {:content_id => content}).each(&:destroy)
  end

end
