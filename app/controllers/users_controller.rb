class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def befriend
    @new_friend = current_user.follow(params[:id])
    redirect_to users_path
  end

  def unfriend
    @old_friend = current_user.unfollow(params[:id])
    redirect_to users_path
  end
end
