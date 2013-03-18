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

  def create_from_notification(n)
    # create_or_link_to_feed
    # feed name = n.css("title").children.first.to_s
    # title     = n.css("entry").css("title").children.to_s
    
    title     = Notification.title(n)
    
    # pub_date  = n.css("published").children.first.to_s
    # content   = n.css("content").children.first.to_s
    # link      = n.css("link").last.attr("href")
  end
end
