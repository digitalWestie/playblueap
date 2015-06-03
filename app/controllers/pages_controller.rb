class PagesController < ApplicationController
  def index
    begin 
      @tweet = TWITTER.user_timeline.first.text
    rescue
      @tweet = ""
    end

    action = Action.accepted.order('tweet_id DESC').last
    if action.blank? or action.created_at < 4.minute.ago #get latest actions
      Action.get_latest_actions
    end
    @actions = Action.accepted.order('tweet_id DESC').limit(12).all
  end
end
