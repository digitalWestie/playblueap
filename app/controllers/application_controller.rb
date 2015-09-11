class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_pages

  def refinery_user_required?
    false
  end

  def get_pages
    @pages = Refinery::Page.all
    @pages.delete_if { |p| ["Home", "hashtags", "Page not found"].include? p.title }
  end

end

Refinery::Admin::BaseController.class_eval do
  def require_refinery_users!
    false
  end
end