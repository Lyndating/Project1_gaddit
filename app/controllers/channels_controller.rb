class ChannelsController < ApplicationController
  before_action :check_for_login
  def index
    @channels = Channel.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @channel = Channel.find params[:id]
  end
end
 