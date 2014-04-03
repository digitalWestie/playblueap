require 'twitter'
BLUEAP_USER_ID = 2298347186 # CHANGE TO..

TWITTER = Twitter::REST::Client.new do |config|
  config.consumer_key =  ENV['TWITTER_CONSUMER_KEY'] #change
  config.consumer_secret =  ENV['TWITTER_CONSUMER_SECRET'] #change
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  
  #config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => {  :open_timeout => 20,  :timeout => 30  })
end