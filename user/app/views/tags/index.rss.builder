xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Voluntourism"
    xml.description "Tags"
    xml.link tags_url(:rss)

    for tag in @tags
      xml.item do
        xml.title tag.name
        xml.pubDate tag.created_at.to_s(:rfc822)
      end
    end
  end
end
