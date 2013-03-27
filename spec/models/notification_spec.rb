require 'spec_helper'

describe Notification do

  before(:each) do
    load_notification
  end

  context ".title" do
    it "should return the feed title" do
      @notification.title == "1"
    end

    it "should return nil if no title is found" do
      @notification = Notification.new([])
      @notification.title.should be_nil
    end

    it "should return the first line of content if no title"
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

    it "should return the title as content if there's no content"
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

  context ".feed_url" do
    it "should return the article's feed url" do
      @notification.feed_url == "http://pubsubhubbub.superfeedr.com"
    end

    it "should return nil if no feed url is found" do
      @notification = Notification.new([])
      @notification.feed_url.should be_nil
    end
  end
end
