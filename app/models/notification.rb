class Notification

  def initialize(n)
    @content = n
  end

  # article related 
  
  # TODO - deal with notifications that have more than one entry
  def title
    @content.css("entry").first.css("title").children.first.to_s rescue nil
  end

  def link
    @content.css("entry").first.css("link").first.attr("href") rescue nil
  end

  def content
    content = @content.css("entry").first.css("content").children.first.to_s rescue nil
    content = self.title if content.blank?
    return content
  end

  def pub_date
    Date.parse(@content.css("entry").first.css("published").children.first.to_s) rescue nil
  end

  # feed related 
  def feed_name
    @content.css("title").children.first.to_s rescue nil
  end
  
  def feed_url
     @content.css("link[type='text/html']").first.attr("href") rescue nil
  end
end