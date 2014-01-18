class User < ActiveRecord::Base
  attr_accessible :avatar_url, :screen_name, :twitter_id
  has_many :actions, :dependent => :destroy
end
