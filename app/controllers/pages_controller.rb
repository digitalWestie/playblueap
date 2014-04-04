class PagesController < ApplicationController
  def index
    begin 
      @tweet = TWITTER.user_timeline.first.text
    rescue
      @tweet = ""
    end
  end
end
