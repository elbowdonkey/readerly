module NotificationHelpers
  def load_notification
    file              = File.open(File.join(Rails.root, "spec", "fixtures", "article.xml"), "r")
    raw_notification  = file.read
    @document         = Nokogiri::XML(raw_notification)
    @notification     = Notification.new(@document)
  end
end
