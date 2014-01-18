class Action < ActiveRecord::Base
  attr_accessible :body, :coefficient, :hashtag, :tweet_id, :user_id
  BLUEAP_USER_ID = 17069499 # CHANGE TO..

  def is_tweet_valid?(tweet)
    is_valid = tweet.attrs[:in_reply_to_user_id].eql?(BLUEAP_USER_ID) #is in reply to blueap
    is_valid = is_valid and !tweet.attrs[:user][:id].eql?(BLUEAP_USER_ID) #cant be from the app
    is_valid = is_valid and !tweet.attrs[:entities][:hashtags].blank? #must have an action hashtag
    is_valid
  end
end
