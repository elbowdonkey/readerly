class Notification

  def initialize(n)
    @content = n
  end

  def title
    @content.css("entry").css("title").children.to_s rescue nil
  end

  def link
    @content.css("link").last.attr("href") rescue nil
  end

  def feed_name
    @content.css("title").children.first.to_s rescue nil
  end

  def content
    @content.css("content").children.first.to_s rescue nil
  end

  def pub_date
    Date.parse(@content.css("published").children.first.to_s) rescue nil
  end

end