# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  feed_id      :integer
#  title        :string(255)
#  published_at :datetime
#  content      :text
#  link         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Article do
  before do
    load_raw_notification
  end

  it { should respond_to(:id) }
  it { should respond_to(:feed_id) }
  it { should respond_to(:title) }
  it { should respond_to(:published_at) }
  it { should respond_to(:content) }
  it { should respond_to(:link) }

  context 'when validating' do
    it 'is invalid without being associated with a feed' do
      article = build(:article, :feed_id => nil)
      article.should_not be_valid
      article.should have(1).error_on(:feed_id)
    end

    it 'is invalid without a title' do
      article = build(:article, :title => nil)
      article.should_not be_valid
      article.should have(1).error_on(:title)
    end

    it 'is invalid without a published date' do
      article = build(:article, :published_at => nil)
      article.should_not be_valid
      article.should have(1).error_on(:published_at)
    end

    it 'is invalid without content' do
      article = build(:article, :content => nil)
      article.should_not be_valid
      article.should have(1).error_on(:content)
    end

    it 'is invalid without a link' do
      article = build(:article, :link => nil)
      article.should_not be_valid
      article.should have(1).error_on(:link)
    end
  end

  context "#create_from_raw_notification" do
    before do
      Article.create_from_raw_notification(@raw_notification)
      @articles = Article.all
      @article  = Article.first
    end

    it "should return valid articles" do
      @articles.each do |article|
        article.should be_an_instance_of(Article)
      end
    end

    it "should belong to a feed" do
      @articles.each do |article|
        article.feed.should be_an_instance_of(Feed)
      end
    end

    it "should have the right title" do
      @article.title.should eq("Dat tongue")
    end

    it "should have the right published_at date" do
      @article.published_at.should eq(DateTime.parse("2013-03-23T22:44:20Z").in_time_zone(Time.zone))
    end

    it "should have the right content" do
      @article.content.should eq("77777777777777")
    end

    it "should have the right link" do
      @article.link.should eq("http://www.reddit.com/r/aww/comments/1avt3w/dat_tongue/")
    end

    it "should allow articles with the same link" do
      article = build(:article, :link => "http://www.reddit.com/r/aww/comments/1avt3w/dat_tongue/")
      article.should be_valid
    end

    it "should not allow articles with the same link and published datetime" do
      article = build(:article, :link => "http://www.reddit.com/r/aww/comments/1avt3w/dat_tongue/", :published_at => DateTime.parse("2013-03-23T22:44:20Z").in_time_zone(Time.zone))
      article.should_not be_valid
    end
  end

  context ".read!" do
    it "should mark an article as read" do
      article = create(:article)
      article.read.should be_false
      article.read!
      article.read.should be_true
    end
  end

  context '#not_found_for_notification' do
    it "should return true if article is not found" do
      n = Notification.new(@raw_notification)
      Article.not_found_for_notification(n).should be_true
    end
    it "should return false if article is found" do
      n = Notification.new(@raw_notification)
      Article.create_from_raw_notification(@raw_notification)
      Article.not_found_for_notification(n).should be_false
    end
  end
end
