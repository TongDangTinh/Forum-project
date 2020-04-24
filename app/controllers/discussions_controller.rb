class DiscussionsController < ApplicationController

  def index
    @discussions = Discussion.all.order("created_at desc")
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new discussion_params

    if @discussion.save 
      flash[:success] = "Discussion created!"
      redirect_to root_path
    else
      render :new 
    end
  end

  private 
    def discussion_params
      params.require(:discussion).permit :title, :content
    end
end
