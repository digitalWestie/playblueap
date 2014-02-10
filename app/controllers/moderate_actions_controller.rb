class ModerateActionsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    #if params.has_key?(:range_start) and params.has_key?(:range_end)
    #  Action.where(:created_at => 1.year.ago..Time.now)
    #else
    Action.get_latest_actions if params.has_key? :import_tweets
    @actions = Action.where(:moderated_at => nil) #unmoderated
    #end
  end

  def update
    rejected = params[:all_actions] - params[:accepted_actions]
    Action.where(:id => rejected).each { |a| a.update_attribute(:moderated_at, Time.now); a.update_attribute(:is_accepted, true)  }
    Action.where(:id => params[:accepted_actions]).each { |a| a.update_attribute(:moderated_at, Time.now) }
    redirect_to moderate_actions_path, :notice => "Actions updated"
  end

end