class FollowingRelationshipsController < ApplicationController

  def follow
    following = User.find(params[:id])
    me = current_user
    followingrelationship = FollowingRelationship.new
    puts "うおおおおお"
    followingrelationship.follower_id = following.id
    followingrelationship.following_id = me.id
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_following
    @following = User.find(params[:id])
  end

end
