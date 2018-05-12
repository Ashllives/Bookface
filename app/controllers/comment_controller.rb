class CommentController < ApplicationController
  def index
    
  end

  def create
    @comment = Comment.new
    @comment.contents = params[:contents]
    @comment.post = Post.find(params[:post])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "You commented to a post!"
    else
      flash[:alert] = @comment.errors.messages[:contents].first
    end
    @comments = Comment.order(created_at: :desc).all
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end
end
