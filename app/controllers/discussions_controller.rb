class DiscussionsController < ApplicationController
  
  def new
    @discussion = Discussion.new
  end

  def create
  end
end
