module NotificationHelpers
  def load_raw_notification
    file                = File.open(File.join(Rails.root, "spec", "fixtures", "multiple_2.xml"), "r")
    xml_string          = file.read
    @raw_notification   = Nokogiri::XML(xml_string)
  end
end
