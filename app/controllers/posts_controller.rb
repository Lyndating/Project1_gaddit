class PostsController < ApplicationController
  before_action :check_for_login, only:[:create,:destroy]
  def new
    @post = Post.new
    @channels = Channel.all.name 
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title,:content,:links)
  end
end
