##
# This small script is an example of what you can do with the superfeedr : 
# we monitor a few feeds with superfeedr and when, these feeds actually have 
# new messages, we are posting them to a twitter account. 
  
require "rubygems"
require "twitter"
require "superfeedr"
 
#############################################################
#                   Configuration
#############################################################
 
##
# Superfeedr
superfeedr = {
  :login => "login@superfeedr.com", 
  :password => "********"
}
 
##
# Twitter
twitter = {
  :login => "twitter",
  :password => "********"
}
 
##
# The feeds
feeds = [ "http://search.twitter.com/search.atom?q=hello", 
"http://en.wikipedia.org/w/index.php?title=Special:RecentChanges&feed=atom", 
"http://feeds.delicious.com/v2/rss/subscriptions/kael?count=15", 
"http://eco.netvibes.com/rss/custom/type/module", 
"http://board.gulli.com/syndicate/newsticker.rss"]
 
#############################################################
#                   Let's go!
#############################################################
 
twitter = Twitter::Base.new(Twitter::HTTPAuth.new(twitter[:login], twitter[:password]))
 
Superfeedr.connect(superfeedr[:login], superfeedr[:password]) do 
  
  ##
  # This block will be called for each notification received from the Superfeedr
  Superfeedr.on_notification do |notification|
    # Logging
    puts "The feed #{notification.feed_url} has been fetched (#{notification.http_status}: #{notification.message_status}) and will be fetched again in #{(notification.next_fetch - Time.now)/60} minutes at most."
 
    notification.entries.each do |e|
      # We post the updates to Twitter
      twitter.update "#{e.title} #{e.link}"
    end
  end
  
  ##
  # Subscribe to all the feeds
  Superfeedr.subscribe(feeds) do |feed|
    puts "Subscribed to : #{feed}"
  end
end 