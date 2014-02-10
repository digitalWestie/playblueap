class AdminBadgesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(params[:badge])
    if @badge.save 
      redirect_to admin_badges_path
    else
      render 'new'
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_path
  end

end
