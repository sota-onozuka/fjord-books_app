class FollowingRelationshipsController < ApplicationController

  #def follow
  #  following = User.find(params[:id])
  #  me = User.find(2)
  #  puts "うおおおおお"
  #  puts current_user
  #  followingrelationship = FollowingRelationship.new
  #  puts "うおおおおお"
  #  followingrelationship.follower_id = following.id
  #  followingrelationship.following_id = me.id
  #  puts followingrelationship.follower_id = following.id, followingrelationship.following_id = me.id
  #end
  #private
  # Use callbacks to share common setup or constraints between actions.
  #def set_following
  #  @following = User.find(params[:id])
  #end

  def create
    puts params[:followed_id]
    puts current_user.id
    puts "うおおおお"
    user = User.find(params[:followed_id].keys[0])
    current_user.follow(user)
    redirect_to user
  end
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
