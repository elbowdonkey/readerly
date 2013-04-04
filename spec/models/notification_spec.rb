require 'spec_helper'

describe Notification do

  before do
    load_raw_notification
    @notification = Notification.new(@raw_notification, 0)
  end

  context ".title" do
    it "should return the entry title" do
      @notification.title.should eq("Dat tongue")
    end

    it "should return nil if no title is found" do
      notification = Notification.new([])
      notification.title.should be_nil
    end
  end

  context ".link" do
    it "should return the article link" do
      @notification.link.should eq("http://www.reddit.com/r/aww/comments/1avt3w/dat_tongue/")
    end
    it "should return nil if no link is found" do
      notification = Notification.new([])
      notification.link.should be_nil
    end
  end

  context ".content" do
    it "should return the article's content" do
      @notification.content.should eq("77777777777777")
    end

    it "should return nil if no content is found" do
      notification = Notification.new([])
      notification.content.should be_nil
    end

    it "should return the summary as content if there's no content" do
      file = File.open(File.join(Rails.root, "spec", "fixtures", "multiple_no_content.xml"), "r")
      xml_string = file.read
      raw_notification = Nokogiri::XML(xml_string)
      notification = Notification.new(raw_notification, 0)
      notification.content.should eq("77777777777777")
    end

    it "should return the title as content if there's no summary or content" do
      file = File.open(File.join(Rails.root, "spec", "fixtures", "multiple_no_content.xml"), "r")
      xml_string = file.read
      raw_notification = Nokogiri::XML(xml_string)
      notification = Notification.new(raw_notification, 1)
      notification.title.should eq("Justin Abdelkader's hat trick helps Detroit stop Ducks")
      notification.content.should eq(notification.title)
    end
  end

   context ".published_at" do
    it "should return the article's published_at date" do
      @notification.published_at.should eq(DateTime.parse("2013-03-23T22:44:20Z").in_time_zone(Time.zone))
    end

    it "should return nil if no published_at date is found" do
      notification = Notification.new([])
      notification.published_at.should be_nil
    end
  end

  context ".feed_name" do
    it "should return the article's feed name" do
      @notification.feed_name.should eq("all subreddits")
    end

    it "should return nil if no feed name is found" do
      notification = Notification.new([])
      notification.feed_name.should be_nil
    end
  end

  context ".feed_url" do
    it "should return the article's feed url" do
      @notification.feed_url.should eq("http://www.reddit.com/r/all/")
    end

    it "should return nil if no feed url is found" do
      notification = Notification.new([])
      notification.feed_url.should be_nil
    end
  end
end
