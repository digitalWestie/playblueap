class Action < ActiveRecord::Base
  attr_accessible :body, :coefficient, :hashtag, :tweet_id, :twitter_user_id, :user_id, :screen_name, :link
  belongs_to :user

  BADGES = {"agriculture" => "Agriculture and Forests", 
    "health" => "Health", 
    "city" => "City Planning and Buildings",
    "coast" => "Coastal Areas",
    "biodiversity" => "Biodiversity and Nature",
    "water" => "Water Management",
    "disaster" => "Disaster Risk Reduction",
    "blueapsays" => "BlueApSays" }
  
  def self.is_tweet_valid?(tweet)
    is_valid = (tweet.attrs[:in_reply_to_user_id].eql?(BLUEAP_USER_ID)) #is in reply to blueap
    is_valid = (is_valid and !tweet.attrs[:user][:id].eql?(BLUEAP_USER_ID)) #cant be from the app
    is_valid = (is_valid and !tweet.attrs[:entities][:hashtags].blank?) #must have an action hashtag
    is_valid
  end

  def self.get_latest_actions(hashtag="")
    results = TWITTER.search("to:playblueap #{hashtag}", :result_type => "recent", :count => 10)
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
  end

end