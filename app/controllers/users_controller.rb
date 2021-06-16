class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def users
    @users = User.all.page(params[:page]).per(3)

  end

  def user
  end
end
