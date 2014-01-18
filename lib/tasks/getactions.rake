namespace :actions do
  desc "Scrape recent tweet actions"
  task :create => :environment do
    results = TWITTER.search("to:playblueap #{hashtag}", :result_type => "recent")
    results.each do |tweet|
      if Action.is_tweet_valid?(tweet)
        u = User.find_or_create_by_twitter_id(tweet.attrs[:user][:id], 
          :avatar_url => tweet.attrs[:user][:profile_image_url], 
          :screen_name => tweet.attrs[:user][:screen_name])

        link = ""
        link = tweet.attrs[:entities][:urls].first[:expanded_url] unless tweet.attrs[:entities][:urls].blank?

        Action.find_or_create_by_tweet_id(tweet.attrs[:id], 
          :body => tweet.text, :coefficient => 1.0, 
          :user_id => u.id,
          :twitter_user_id => tweet.attrs[:user][:id], 
          :hashtag => tweet.attrs[:entities][:hashtags].first[:text],
          :link => link,
          :screen_name => tweet.attrs[:user][:screen_name])        
      end
    end
    #:since_id (Integer) — Returns results with an ID greater than (that is, more recent than) the specified ID. 
    #There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
  end
end