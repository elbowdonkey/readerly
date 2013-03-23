require 'spec_helper'

describe Notification do

  before(:each) do
    raw_notification  = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\n  <status xmlns=\"http://superfeedr.com/xmpp-pubsub-ext\" feed=\"http://push-pub.appspot.com/feed\">\n    <http code=\"200\">Fetched (ping) 200 and parsed 1/20 entries</http>\n    <next_fetch>2013-03-18T00:52:26Z</next_fetch>\n    <entries_count_since_last_maintenance>7</entries_count_since_last_maintenance>\n    <period>181</period>\n    <last_fetch>2013-03-18T00:49:25Z</last_fetch>\n    <last_parse>2013-03-18T00:49:25Z</last_parse>\n    <last_maintenance_at>2013-03-17T17:07:43Z</last_maintenance_at>\n    <title>Publisher example</title>\n    <id>http://push-pub.appspot.com/feed</id>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n    <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n    <title>Publisher example</title>\n    <id>http://push-pub.appspot.com/feed</id>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n    <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n    <title>Publisher example</title>\n    <id>http://push-pub.appspot.com/feed</id>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n    <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n    <title>Publisher example</title>\n    <id>http://push-pub.appspot.com/feed</id>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n    <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n    <title>Publisher example</title>\n    <id>http://push-pub.appspot.com/feed</id>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n    <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n  </status>\n  <link title=\"Publisher example\" rel=\"self\" href=\"http://push-pub.appspot.com/feed\" type=\"application/atom+xml\"/>\n  <link title=\"\" rel=\"hub\" href=\"http://pubsubhubbub.superfeedr.com\" type=\"text/html\"/>\n  <title>Publisher example</title>\n  <updated>2013-03-18T00:49:24Z</updated>\n  <id>http://push-pub.appspot.com/feed</id>\n  <entry xmlns=\"http://www.w3.org/2005/Atom\" xmlns:geo=\"http://www.georss.org/georss\" xmlns:as=\"http://activitystrea.ms/spec/1.0/\" xmlns:sf=\"http://superfeedr.com/xmpp-pubsub-ext\">\n    <id>http://push-pub.appspot.com/feed/703002</id>\n    <published>2013-03-18T00:49:24Z</published>\n    <updated>2013-03-18T00:49:24Z</updated>\n    <title>1</title>\n    <content type=\"text\">77777777777777</content>\n    <link title=\"1\" rel=\"alternate\" href=\"http://push-pub.appspot.com/entry/703002\" type=\"text/html\"/>\n  </entry>\n</feed>\n"
    @notification     = Notification.new(Nokogiri::XML(raw_notification))
  end

  context ".title" do
    it "should return the feed title" do
      @notification.title == "1"
    end
    
    it "should return nil if no title is found" do 
      @notification = Notification.new([])
      @notification.title.should be_nil
    end
  end

  context ".link" do
    it "should return the article link" do
      @notification.link == "http://push-pub.appspot.com/entry/703002"
    end
    it "should return nil if no link is found" do
      @notification = Notification.new([])
      @notification.link.should be_nil
    end
  end

  context ".content" do
    it "should return the article's content" do
     @notification.content  == "77777777777777"
    end

    it "should return nil if no content is found" do
      @notification = Notification.new([])
      @notification.content.should be_nil
    end
  end

   context ".pub_date" do
    it "should return the article's pub_date" do
      @notification.pub_date == Date.parse("2013-03-18T00:49:24Z")
    end

    it "should return nil if no pub_date is found" do
      @notification = Notification.new([])
      @notification.pub_date.should be_nil
    end
  end

  context ".feed_name" do
    it "should return the article's feed name" do
      @notification.feed_name == "Publisher example"
    end

    it "should return nil if no feed name is found" do
      @notification = Notification.new([])
      @notification.feed_name.should be_nil
    end
  end
end
