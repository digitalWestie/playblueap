class PagesController < ApplicationController
  def index
    @tweet = TWITTER.user_timeline.first.text
  end
end
