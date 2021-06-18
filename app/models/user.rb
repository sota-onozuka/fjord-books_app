# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  #def follow(other_user)
  #  unless self == other_user
  #    self.following_relationships.find_or_create_by(follow_id: other_user.id)
  #  end
  #end

  def follow
    following = User.find(params[:id])
    me = current_user
    followingrelationship = FollowingRelationship.new(following_relationship_params)
    puts "うおおおおお"
    followingrelationship.follower_id = following.id
    followingrelationship.following_id = me.id
  end

end
