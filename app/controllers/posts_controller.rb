class PostsController < ApplicationController
  before_action :check_for_login
  def new
    @post = Post.new
    @channels = Channel.all.name 
  end

  def create
    post = Post.create post_params
    @current_user.posts << post
    
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:title)
  end
end
