class Notification
  def initialize(raw_notification, entry_index = 0)
    @content = raw_notification
    @entry_index = entry_index
  end

  # article-related

  def title
    @content.css("entry")[@entry_index].css("title").children.first.to_s rescue nil
  end

  def link
    @content.css("entry")[@entry_index].css("link").first.attr("href") rescue nil
  end

  def content
    content = @content.css("entry")[@entry_index].css("content").children.first.to_s rescue nil
    content = @content.css("entry")[@entry_index].css("summary").first.children.first.to_s if content.blank? rescue nil
    content = self.title if content.blank?
    return content
  end

  def published_at
    Date.parse(@content.css("entry")[@entry_index].css("published").children.first.to_s).to_datetime rescue nil
  end

  # feed-related

  def feed_name
    @content.css("title").children.first.to_s rescue nil
  end

  def feed_url
    @content.css("link[type='text/html']").first.attr("href") rescue nil
  end
end
