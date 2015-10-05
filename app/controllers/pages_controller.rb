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

    p=Refinery::Page.find_by_slug("home")
    @intro_header = "PlayBlueap e' un gioco sociale dove cittadini vengono premiati per azioni a favore della salute ambientale della città"
    @intro_header = p.content_for(:body) unless p.blank?
  end
end
