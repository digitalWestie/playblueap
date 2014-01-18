class Action < ActiveRecord::Base
  attr_accessible :body, :coefficient, :hashtag, :tweet_id, :twitter_user_id, :user_id, :screen_name
  
  def self.is_tweet_valid?(tweet)
    is_valid = (tweet.attrs[:in_reply_to_user_id].eql?(BLUEAP_USER_ID)) #is in reply to blueap
    is_valid = (is_valid and !tweet.attrs[:user][:id].eql?(BLUEAP_USER_ID)) #cant be from the app
    is_valid = (is_valid and !tweet.attrs[:entities][:hashtags].blank?) #must have an action hashtag
    is_valid
  end

  def self.get_latest_actions(hashtag="")
    results = TWITTER.search("to:playblueap #{hashtag}", :result_type => "recent")
    results.each do |tweet|
      if Action.is_tweet_valid?(tweet)
        
        link = ""
        link = tweet.attrs[:entities][:urls].first[:expanded_url] unless tweet.attrs[:entities][:urls].blank?

        Action.find_or_create_by_tweet_id(tweet.attrs[:id], 
          :body => tweet.text, :coefficient => 1.0, 
          :twitter_user_id => tweet.attrs[:user][:id], 
          :hashtag => tweet.attrs[:entities][:hashtags].first[:text],
          :link => link,
          :screen_name => tweet.attrs[:user][:screen_name])
      end
    end
  end

end
