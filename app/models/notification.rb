class Notification

  def initialize(n)
    @content = n
  end

  def title
    @content.css("entry").css("title").children.to_s
  end

  def link
    @content.css("link").last.attr("href") rescue nil
  end

end