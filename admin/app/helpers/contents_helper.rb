module ContentsHelper
  def add_content_image_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :content_images, :partial => 'content_image',:object => ContentImage.new
    end
  end
end
