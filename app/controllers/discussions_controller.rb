class DiscussionsController < ApplicationController
  before_action :find_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all.order("created_at desc")
  end

  def show
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
  
  def edit
  end

  def update 

    if @discussion.update_attribute discussion_params
      flash[:success] = "Discussion updated!"
      redirect_to discustion_path
    else
      render :edit
    end
  end

  def distroy
    @discussion.destroy
  end


  private 
    def discussion_params
      params.require(:discussion).permit :title, :content
    end

    def find_discussion
      @discussion = Discussion.find params[:id]
    end
end
