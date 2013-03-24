class ArticlesController < ApplicationController
  before_filter :authenticate
  
  # Make sure you run this in the console while the app is available 
  # thru your fwd.fw account. If you don't want to do it, generate 
  # some articles and feeds or ask me for a dump --caffo
  #
  # Reader::Application::Configuration['feeds'].each do |f|
  #   Reader::Application::Superfeedr.subscribe(f)
  # end

  def index
    @articles = Article.where(:read => nil).order("published_at ASC")
  end

  def read
    render :json => Article.find(params[:id]).read!
  end

  def subscribe
  end
end
