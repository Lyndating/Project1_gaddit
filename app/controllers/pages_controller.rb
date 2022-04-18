class PagesController < ApplicationController
  def home
    if @current_user
      @posts = Post.where(channel_id: @current_user.channels).limit(60)
    else
      @posts = Post.where(channel_id: Channel.all).limit(60)
    end
  end
end
