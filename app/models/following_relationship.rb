# frozen_string_literal: true

class FollowingRelationship < ApplicationRecord
  belongs_to :follower, class_name: 'User' # followerというUserクラスのインスタンスによって所有されている。
  belongs_to :followed, class_name: 'User'
end
