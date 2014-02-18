class Badge < ActiveRecord::Base
  attr_accessible :hashtag, :name, :required_actions
  validates_presence_of :hashtag
  validates_presence_of :name
  validates_presence_of :required_actions

  def players
    Player.joins(:actions).where("actions.hashtag" => hashtag).uniq
  end
end
