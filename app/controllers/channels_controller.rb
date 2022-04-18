class ChannelsController < ApplicationController
  before_action :check_for_login, :except => [:show]
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find params[:id]
    @channel_id = @channel.id
  end

  def leave
    channel = Channel.find params[:id]
    @current_user.channels.delete(channel)
    redirect_to channels_path
  end

  def join
    channel = Channel.find params[:id]
    @current_user.channels.append(channel)
    redirect_to channels_path
  end


end
