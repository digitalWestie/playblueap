class AdminController < ApplicationController
  
  before_filter :authorize_admin

  private

  def authorize_admin
    authenticate_user!
    unless current_user.has_role?("Superuser") or current_user.has_role?("Admin")
      redirect_to root_path, notice: "You are not authorized to perform that action"
    end
  end

end