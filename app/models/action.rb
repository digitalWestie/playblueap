class Action < ActiveRecord::Base
  attr_accessible :body, :coefficient, :hashtag, :tweet_id, :twitter_user_id, 
    :player_id, :screen_name, :link, :video_url, :photo_url
  belongs_to :player

  CATEGORIES = {"agricoltura" => "Agriculture and forests", 
    "edifici" => "City planning and buildings",
    "resilienza" => "Resilience",
    "verde" => "Green, biodiversity, and nature",
    "acqua" => "Water management",
    "mobilità" => "Transport and mobility" }
  
  def status_url
    "https://twitter.com/#{screen_name}/status/#{tweet_id}"
  end

  def self.accepted
    where(:is_accepted => true).where("moderated_at IS NOT NULL")
  end

  def self.rejected
    where(:is_accepted => false).where("moderated_at IS NOT NULL")
  end

  def self.is_tweet_valid?(tweet)
    is_valid = (tweet.attrs[:in_reply_to_user_id].eql?(BLUEAP_USER_ID)) #is in reply to blueap
    is_valid = (is_valid and !tweet.attrs[:user][:id].eql?(BLUEAP_USER_ID)) #cant be from the app
    is_valid = (is_valid and !tweet.attrs[:entities][:hashtags].blank?) #must have an action hashtag
    is_valid and !tweet.retweet? #is not a retweet
  end

  def self.latest_tweet
    order('created_at DESC').first
  end

  def self.get_latest_actions(hashtag="")
    #results = TWITTER.search("to:playblueap #{hashtag} -rt", :result_type => "recent", :count => 10)
    tweet_id = 1
    tweet_id = latest_tweet.tweet_id unless latest_tweet.try(:tweet_id).blank?
    
    begin
      results = TWITTER.mentions_timeline(:since_id => tweet_id)
    rescue Twitter::Error::TooManyRequests => e
      Rails.logger.info e.message
      results = []
    end
    
    results.each do |tweet|
      if Action.is_tweet_valid?(tweet)
        u = Player.find_or_create_by_twitter_id(tweet.attrs[:user][:id], 
          :avatar_url => tweet.attrs[:user][:profile_image_url], 
          :screen_name => tweet.attrs[:user][:screen_name])

        link = ""
        link = tweet.attrs[:entities][:urls].first[:expanded_url] unless tweet.attrs[:entities][:urls].blank?

        video_url = ""
        photo_url = ""
        
        if tweet.attrs[:entities].has_key?(:media)
          for media in tweet.attrs[:entities][:media]
            if media[:type].eql? "photo"
              photo_url = media[:media_url]
            elsif media[:type].eql? "video"
            else
            end
          end
        end

        Action.find_or_create_by_tweet_id(tweet.attrs[:id], 
          :body => tweet.text, :coefficient => 1.0, 
          :player_id => u.id,
          :twitter_user_id => tweet.attrs[:user][:id], 
          :hashtag => tweet.attrs[:entities][:hashtags].first[:text],
          :link => link,
          :photo_url => photo_url,
          :video_url => video_url,
          :screen_name => tweet.attrs[:user][:screen_name])        
      end
    end
  end

end