class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:subscribe]
  before_filter :check_subscriptions, :only => [:index]
  before_filter :delete_read_articles, :only => [:index]

  def index
    @articles = Article.where(:read => false).order("published_at ASC")
  end

  def read
    response = params[:all].present? ? Article.all.map(&:read!)  :  Article.find(params[:id]).read!
    render :json => response
  end

  def subscribe
  end

  private

  def check_subscriptions
    User.setup!
  end

  def delete_read_articles
    Article.where(:read => true).delete_all
  end
end
