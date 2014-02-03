class ModerateActionsController < ApplicationController
  def index
    #if params.has_key?(:range_start) and params.has_key?(:range_end)
    #  Action.where(:created_at => 1.year.ago..Time.now)
    #else
    @actions = Action.where(:moderated_at => nil) #unmoderated
    #end
  end

  def update
    
  end
end