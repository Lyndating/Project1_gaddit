class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to post_path(@comment.post_id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def delete
    comment = Comment.find(params[:id])
    @post = comment.post_id
    if comment.user_id == @current_user.id
      comment.destroy
      redirect_to post_path(@post)
    end
  end

  private  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
