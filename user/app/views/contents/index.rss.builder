xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Voluntourism"
    xml.description "Contents"
    xml.link contents_url(:rss)

    for content in @contents
      xml.item do
        xml.title content.title
        xml.description content.body
        xml.pubDate content.created_at.to_s(:rfc822)
        xml.link content_url(content, :html)
      end
      xml.image do
        xml.url content.content_image.url(:small)
      end
    end
  end
end
