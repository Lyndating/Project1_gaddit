class PostsController < ApplicationController
  before_action :check_for_login, except: [:show]
  def new
    @post = Post.new
    if params[:format]
      @channel_id = params[:format]
      @channel = Channel.find params[:format]
    end
  end

  def create
    post = Post.create post_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.links = req["public_id"]
    end
    post.update_attributes(post_params)
    post.user_id = @current_user.id
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
    @comment = Comment.new params[:post_id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update 
    post = Post.find params[:id]
    post.update post_params
    redirect_to post
  end

  def destroy
    @post = Post.find params[:id]
      @post.destroy
      redirect_to root_path
    
  end

  def contact
    @comment = Comment.new
  end

  private
    def post_params
      params.require(:post).permit(:title,:content,:channel_id,:links)
    end
end
