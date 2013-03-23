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
end
