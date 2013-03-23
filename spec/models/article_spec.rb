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
end
