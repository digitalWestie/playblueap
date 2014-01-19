class ActionsController < ApplicationController
  def index
    action = Action.order('tweet_id DESC').last
    if action.blank? or action.created_at < 4.minute.ago #get latest actions
      Action.get_latest_actions
    end
    @actions = Action.order('tweet_id DESC').limit(60).all
  end

  def totals
    @badge_counts = {}
    Action::BADGES.each do |hashtag, name|
      count = Action.where(:hashtag => hashtag).count
      @badge_counts.merge!({name => count})
    end
  end
end