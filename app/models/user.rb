# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, class_name:  "FollowingRelationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed # activerelationshipsというテーブルを通して、followedというユーザークラスのインスタンス(source)を複数(has many)参照するようにする
  has_many :followers, through: :passive_relationships, source: :follower
  #def follow
  #  following = User.find(params[:id])
  #  me = current_user
  #  followingrelationship = FollowingRelationship.new(following_relationship_params)
  #  puts "うおおおおお"
  #  followingrelationship.follower_id = following.id
  #  followingrelationship.following_id = me.id
  #end

    # ユーザーをフォローする
    def follow(other_user)
      following << other_user
    end
  
    # ユーザーをフォロー解除する
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
  
    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end
end
