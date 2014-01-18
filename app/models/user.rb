class User < ActiveRecord::Base
  attr_accessible :avatar_url, :screen_name, :twitter_id
end
