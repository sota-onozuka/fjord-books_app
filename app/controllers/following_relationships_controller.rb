# frozen_string_literal: true

class FollowingRelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id].keys[0])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = FollowingRelationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
