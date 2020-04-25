class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index 
    @channels = Channel.all
    @discussions = Discussion.all.order("created_at")
  end

  def show
    @channle = Channel.all
    @discussions = Discussion.where("channel_id = ?", @channel.id)
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new channel_params

    if @channel.save 
      flash[:success] = "Channel created!"
      redirect_to channels_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @channel.update channel_params
      flash[:success] = "Channel updated!"
      redirect_to channels_path
    else
      render :edit
    end
  end

  def destroy
    @channel.destroy 
    redirect_to channels_path
  end

  private

  def channel_params
    params.require(:channel).permit :channel
  end

  def set_channel
    @channel = Channel.find params[:id]
  end
end
