class ModerateActionsController < AdminController
  
  def index
    #if params.has_key?(:range_start) and params.has_key?(:range_end)
    #  Action.where(:created_at => 1.year.ago..Time.now)
    #else
    Action.get_latest_actions if params.has_key? :import_tweets
    @actions = Action.where(:moderated_at => nil) #unmoderated
    #end
  end

  def rejected
    @actions = Action.rejected
  end

  def accepted
    @actions = Action.accepted
  end

  def update
    unselected = params[:all_actions] - params[:selected_actions]
    accept_selected = true
    accept_selected = false if params.has_key?(:reject_tweets)
    Action.where(:id => unselected).each { |a| a.update_attribute(:moderated_at, Time.now); a.update_attribute(:is_accepted, !accept_selected) }
    Action.where(:id => params[:selected_actions]).each { |a| a.update_attribute(:moderated_at, Time.now); a.update_attribute(:is_accepted, accept_selected) }
    redirect_to moderate_actions_path, :notice => "Actions updated"
  end

end