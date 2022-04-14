class ChannelsController < ApplicationController
  before_action :check_for_login
  def index
    @channels = Channel.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @channel = Channel.find params[:id]
  end

  private
  def remove_channel_from_user
    channel = Channel.find(params[:channel][:id])
    user = channel.users.find(params[:user][:id])
    if user
      channel.users.delete(user)
    end
  end 
end
