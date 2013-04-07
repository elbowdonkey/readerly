require 'spec_helper'

describe ArticlesController do
  before do
    http_login
  end

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
end
