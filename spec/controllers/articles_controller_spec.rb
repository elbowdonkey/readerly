require 'spec_helper'

describe ArticlesController do
  before(:each) do
    http_login
    Typhoeus::Request.stub(:post).and_return(OpenStruct.new(:body => "true"))
  end

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should populate the user feed list if none is found in it" do
      get :index
      User.first.feeds.should_not be_empty
    end
  end
end
