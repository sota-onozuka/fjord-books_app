class FollowingRelationship < ApplicationRecord
  belongs_to :follower, class_name: "User" #followerというUserクラスのインスタンスによって所有されている。
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
