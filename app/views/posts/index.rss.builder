xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title installation.title
    xml.description installation.description
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description raw(RedCloth.new(post.content).to_html)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
