require 'spec_helper'

describe User do
    it { should respond_to(:id) }
    it { should respond_to(:config) }
    it { should respond_to(:feeds) }

    context '#check_subscriptions!(feeds_from_config)' do
      before(:each) do
        @user  = User.new
        @feeds =  ['http://google.com/feed', 'http://facebook.com/feed']
        
        Typhoeus::Request.stub(:post).and_return(OpenStruct.new(:body => "true"))
      end

      it 'should initialize the config hash'  do
        @user.check_subscriptions!([])
        @user.config.should_not be_nil
      end

      it 'should initialize .feeds'  do
        @user.check_subscriptions!([])
        @user.feeds.should_not be_nil
        @user.feeds.should be_empty
      end

      it 'should return a feed when accessing self.config["feeds"] if one is added to self.config' do        
        @user.check_subscriptions!(@feeds)
        @user.config[:feeds].should eq(@feeds)
      end

      it 'should return a feed when accessing self.feeds if one is added to self.config' do
        @user.check_subscriptions!(@feeds)
        @user.feeds.should eq(@feeds)
      end

      it 'should return nil when self.config is accessed and no feeds are found' do
         @user.config.should eq({})
      end

      it 'should return nil when self.feeds is accessed and no feeds are found' do
        @user.feeds.should be_nil
      end
    end

    context 'when dealing with feeds with an already populated field' do
      before(:each) do
        Typhoeus::Request.stub(:post).and_return(OpenStruct.new(:body => "true"))

        @user  = User.new
        @feeds = ['http://google.com/feed', 'http://facebook.com/feed']

        @user.check_subscriptions!(@feeds)
        @user.save
      end
      
      it 'should not add a feed a duplicated feed' do
        feeds = ['http://google.com/feed', 'http://facebook.com/feed', 'http://yahoo.com/feed']

        @user.check_subscriptions!(feeds)
        @user.feeds.should eq(['http://google.com/feed', 'http://facebook.com/feed', 'http://yahoo.com/feed'])
      end

      it 'should remove feeds not found in the config file' do
        feeds = ['http://facebook.com/feed']
        @user.check_subscriptions!(feeds)
        @user.feeds.should eq(['http://facebook.com/feed'])
      end

      it 'should unsubscribe feeds not found in the config file' do
        Readerly::Application::Superfeedr.should_receive(:unsubscribe).with('http://google.com/feed')
        
        feeds = ['http://facebook.com/feed']
        @user.check_subscriptions!(feeds)
      end

      it 'should subscribe feeds found in the config file but not in the field' do
        Readerly::Application::Superfeedr.should_receive(:subscribe).with('http://yahoo.com/feed')

        feeds = ['http://google.com/feed', 'http://facebook.com/feed', 'http://yahoo.com/feed']
        @user.check_subscriptions!(feeds)
      end
    end

    context '#dirty_feed_list?(master_list)' do
      before(:each) do
        Typhoeus::Request.stub(:post).and_return(OpenStruct.new(:body => "true"))

        @user  = User.new
        @feeds =  ['http://google.com/feed', 'http://facebook.com/feed']
        @user.check_subscriptions!(@feeds)
        @user.save
      end

      it 'returns true if there are less items in the master list than in the feeds field' do
        master_list = ['http://facebook.com/feed']
        @user.dirty_feed_list?(master_list).should be_true
      end
      
      it 'returns true if there are more items in the master list than in the feeds field' do
        master_list =  ['http://google.com/feed', 'http://facebook.com/feed', 'http://yahoo.com/feed']
        @user.dirty_feed_list?(master_list).should be_true
      end

      it 'returns false if there is no differences between .feeds and the master list' do |variable|
        master_list = ['http://google.com/feed', 'http://facebook.com/feed']
        @user.dirty_feed_list?(master_list).should be_false
      end
    end
end
