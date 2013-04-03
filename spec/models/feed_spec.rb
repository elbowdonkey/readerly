# == Schema Information
#
# Table name: feeds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Feed do
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:url) }

  context 'when validating' do
    it 'is invalid without a name' do
      feed = build(:feed, :name => nil)
      feed.should_not be_valid
      feed.should have(1).error_on(:name)
    end
    
    it 'is invalid without a url' do
      feed = build(:feed, :url => nil)
      feed.should_not be_valid
      feed.should have(1).error_on(:url)
    end
  end

  context 'for_notification' do
    it 'returns the feed object if one is found' do
      feed         = create(:feed)
      notification = OpenStruct.new(:feed_name => feed.name, :feed_url => feed.url)

      Feed.for_notification(notification).should be_valid
      Feed.for_notification(notification).should eq(feed)
    end
    
    it 'returns the new feed object if no feed is found for the notification' do
      new_feed     = {:name => "Feed Name", :url => "http://feed.com/url"}
      notification = OpenStruct.new(:feed_name => new_feed[:name], :feed_url => new_feed[:url] )

      Feed.for_notification(notification).should be_valid
      Feed.for_notification(notification).name.should eq(new_feed[:name])
      Feed.for_notification(notification).url.should eq(new_feed[:url])
    end
  end
end
