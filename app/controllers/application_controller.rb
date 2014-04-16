class ApplicationController < ActionController::Base
  protect_from_forgery

  def refinery_user_required?
    false
  end

end

Refinery::Admin::BaseController.class_eval do
  def require_refinery_users!
    false
  end
end