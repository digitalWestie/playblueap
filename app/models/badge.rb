class Badge < ActiveRecord::Base
  attr_accessible :hashtag, :name, :required_actions
  validates_presence_of :hashtag
  validates_presence_of :name
  validates_presence_of :required_actions

  def players
    as = Action.where(:hashtag => hashtag).select(:player_id)
    pids = as.collect {|a| a.player_id }
    pids.delete_if {|p| pids.count(p) < required_actions }
    Player.where(:id => pids)
  end
end
