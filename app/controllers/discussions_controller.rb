class DiscussionsController < ApplicationController
  before_action :find_discussion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index, :show
  before_action :find_channel, only: [:index, :show, :new, :edit]

  def index
    @discussions = Discussion.all.order("created_at desc")
  end

  def show
    @discussions = Discussion.all.order("created_at desc")
  end

  def new
    @discussion = current_user.discussions.build
  end

  def create
    @discussion = current_user.discussions.build discussion_params

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
      redirect_to discustions_path
    else
      render :edit
    end
  end

  def distroy
    @discussion.destroy
    redirect_to discussions_path
  end


  private 
    def discussion_params
      params.require(:discussion).permit :title, :content
    end

    def find_discussion
      @discussion = Discussion.find params[:id]
    end

    def find_channel
      @channels = Channel.all.order("created_at desc")
    end
end
