class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_discussion, only: [:show, :create, :edit, :update, :destroy]

  def new

  end

  def create 
    @reply = @discussion.replies.create(params[:reply].permit(:reply, :discussion_id))
    @reply.user_id = current_user.id


    if @reply.save 
      redirect_to discussion_path(@discussion)
    else
      redirect_to discussion_path(@discussion)
    end
  end


  def edit
    @discussion = Discussion.find params[:discussion_id]
    @reply = @discussion.replies.find params[:id]
  end

  def update
    @reply = @discussion.replies.find params[:id]
    if @reply.update reply_params
      redirect_to discussion_path(@discussion)
    else
      render :edit
    end
  end


  def destroy
    @reply = @discussion.replies.find params[:id]
    @reply.destroy
    redirect_to discussion_path(@discussion)
  end

  private
  
    def reply_params
      params.require(:reply).permit :reply
    end

    def set_reply
      @reply = Reply.find params[:id]
    end

    def set_discussion
      @discussion = Discussion.find params[:discussion_id]
    end
end
