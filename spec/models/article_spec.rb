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
  before(:each) do
    load_notification
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
    it "should return a valid article" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.should be_an_instance_of(Article)
    end

    it "should belongs to a feed" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.feed.should be_an_instance_of(Feed)
    end

    it "should have the right title" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.title == "1"
    end

    it "should have the right published_at date" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.published_at == Date.parse("2013-03-18T00:49:24Z")
    end

    it "should have the right content" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.content == "77777777777777"
    end

    it "should have the right link" do
      article = Article.create_from_raw_notification(@raw_notification)
      article.content == "http://push-pub.appspot.com/entry/703002"
    end

    it "should not create duplicate entries" do
      article = create(:article, :link => "http://push-pub.appspot.com/entry/703002")
      Article.create_from_raw_notification(@raw_notification).should be_false
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

end
