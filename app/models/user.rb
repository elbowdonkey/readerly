class User < ActiveRecord::Base
  attr_accessible :config
  store :config, accessors: [:feeds]

  def check_subscriptions!(feeds_from_config=APP_CONFIG['feeds'])
    to_unsubscribe, to_subscribe, updated_list = self.feed_list_diff(feeds_from_config)

    to_unsubscribe.each {|f| puts "** unsubscribing to #{f}"; Readerly::Application::Superfeedr.unsubscribe(f) }
    to_subscribe.each   {|f| puts "** subscribing to #{f}"; Readerly::Application::Superfeedr.subscribe(f)   }

    self.feeds = updated_list.reject{|f| !feeds_from_config.include?(f) && self.feeds.include?(f) }
    self.save
  end

  def dirty_feed_list?(feeds_from_config=APP_CONFIG['feeds'])
   to_unsubscribe, to_subscribe = self.feed_list_diff(feeds_from_config)
   to_unsubscribe.empty? && to_subscribe.empty? ? false : true
  end

  def feed_list_diff(feeds_from_config)
    self.feeds   ||= []

    updated_list   = self.feeds.empty? ? feeds_from_config : (self.feeds + feeds_from_config).uniq
    to_unsubscribe = updated_list.select{|f| !feeds_from_config.include?(f) && self.feeds.include?(f)  }
    to_subscribe   = updated_list.select{|f| feeds_from_config.include?(f)  && !self.feeds.include?(f) }

    return to_unsubscribe, to_subscribe, updated_list
  end
end
