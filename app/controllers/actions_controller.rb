class ActionsController < ApplicationController
  def index
    action = Action.order('created_at ASC').first
    if action.blank? or action.created_at < 4.minute.ago #get latest actions
      Action.get_latest_actions
    end
    @actions = Action.order('created_at ASC').all
  end
end
