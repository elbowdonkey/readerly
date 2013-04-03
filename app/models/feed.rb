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

class Feed < ActiveRecord::Base
  attr_accessible :name, :url

  validates :name, :presence  => true
  validates :url, :presence  => true

  has_many :articles

  def self.for_notification(n)
    find_or_create_by_name_and_url(n.feed_name, n.feed_url)
  end
end
