class Notification

  def self.title
    notification.css("entry").css("title").children.to_s
  end
end