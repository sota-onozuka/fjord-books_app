# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    puts "うおおおおおおおおおおおおおおおおおおおおおおお"
    @users = User.with_attached_avatar.order(:id).page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
  end
end
