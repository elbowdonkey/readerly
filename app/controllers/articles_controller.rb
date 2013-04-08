class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:subscribe]
  before_filter :check_subscriptions, :only => [:index]

  def index
    @articles = Article.where(:read => false).order("published_at ASC")
  end

  def read
    render :json => Article.find(params[:id]).read!
  end

  def subscribe
  end

  private
  
  def check_subscriptions
    user = User.first_or_create
    user.check_subscriptions! if user.dirty_feed_list?
  end
end
