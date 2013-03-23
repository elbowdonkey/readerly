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

class Article < ActiveRecord::Base
  attr_accessible :content, :feed_id, :link, :published_at, :title
  
  validates :feed_id,        :presence => true
  validates :title,          :presence => true
  validates :published_at,   :presence => true
  validates :content,        :presence => true
  validates :link,           :presence => true

  def self.create_from_notification(n)
    notification = Notification.new(n)
    # create_or_link_to_feed
  end
end
