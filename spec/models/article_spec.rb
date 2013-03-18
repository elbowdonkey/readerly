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
    it 'is invalid without being associated with a feed'
    it 'is invalid without a title'
    it 'is invalid without a published date'
    it 'is invalid without content'
    it 'is invalid without a link'
  end
end
