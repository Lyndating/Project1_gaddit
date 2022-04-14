class PostsController < ApplicationController
  before_action :check_for_login, only:[:create,:destroy]
  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params
    puts post_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.links = req["public_id"]
    end
    post.update_attributes(post_params)
    post.save
    if post.save
      flash[:success] = "Post created!"
      redirect_to post_path(post)
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
    puts params
    params.require(:post).permit(:title,:content,:channel_id,:links)
  end
end
