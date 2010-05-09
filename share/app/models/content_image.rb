class ContentImage < ActiveRecord::Base
  belongs_to :content
  has_attached_file :content_image,
                  :url  => "/assets/content_images/:id/:basename.:extension",
  :path => ":rails_root/public/assets/content_images/:id/:basename.:extension"


end
