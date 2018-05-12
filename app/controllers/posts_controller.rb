class PostsController < ApplicationController
  def index
    if user_signed_in?
      my_friends = User.find(current_user.id).following.pluck(:id)
      my_friends << current_user.id
      @posts = Post.order(created_at: :desc).where(user_id: my_friends)
    end
  end

  def create
    @post = Post.new
    @post.contents = params[:contents]
    @post.user = current_user
    if @post.save
      flash[:notice] = "You have successfully created a post!"
    else
      flash[:alert] = @post.errors.messages[:contents].first
    end
    @posts = Post.order(created_at: :desc).all
    render :index
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
