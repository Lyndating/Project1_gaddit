class ChannelsController < ApplicationController
  before_action :check_for_login
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find params[:id]
  end
end
 