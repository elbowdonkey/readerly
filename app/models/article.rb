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
#  notification :text
#  read         :boolean
#

class Article < ActiveRecord::Base
  attr_accessible             :content, :feed_id, :link, :published_at, :title, :notification

  validates :feed_id,         :presence => true
  validates :title,           :presence => true
  validates :published_at,    :presence => true
  validates :content,         :presence => true
  validates :link,            :presence => true,
                              :uniqueness => { :scope => :published_at }
  belongs_to :feed

  def self.create_from_raw_notification(raw_notification)
    raw_notification.css('entry').each_with_index do |entry, index|
      notification = Notification.new(raw_notification, index)
      feed = Feed.find_or_create_by_name_and_url(notification.feed_name, notification.feed_url)
      if Article.where(:link => notification.link, :published_at => notification.published_at).empty?
        article              = Article.new
        article.feed         = feed
        article.title        = notification.title
        article.published_at = notification.published_at
        article.content      = notification.content
        article.link         = notification.link
        article.notification = raw_notification.document.to_s
        article.save
      end
    end
  end

  def raw_data
    Nokogiri::XML(self.notification)
  end

  def read!
    self.update_attribute(:read, 1)
  end
end
