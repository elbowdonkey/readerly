class Notification
  def initialize(raw_notification, entry_index = 0)
    @content = raw_notification
    @entry_index = entry_index
  end

  # Article-related methods

  def title
    entry.css("title").children.first.to_s rescue nil
  end

  def link
    link = entry.css("link[rel='canonical']").first.attr("href") rescue nil
    link = entry.css("link").first.attr("href") if link.blank? rescue nil
    return link
  end

  def content
    content = entry.css("content").children.first.to_s rescue nil
    content = entry.css("summary").first.children.first.to_s if content.blank? rescue nil
    content = self.title if content.blank?
    return content
  end

  def published_at
    DateTime.parse(entry.css("published").children.first.to_s).in_time_zone(Time.zone) rescue nil
  end

  # Feed-related methods

  def feed_name
    @content.css("title").children.first.to_s rescue nil
  end

  def feed_url
    @content.css("link[type='text/html']").first.attr("href") rescue nil
  end

  # Helpers

  def entry
    @content.css("entry")[@entry_index]
  end
end
