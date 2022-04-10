class PostsController < ApplicationController
  
  def new
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
  end
end
