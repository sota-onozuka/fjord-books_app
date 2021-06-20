require "test_helper"

class FollowingRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @followingrelationship = FollowingRelationship.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id)
  end

  test "should be valid" do
    assert @followingrelationship.valid?
  end

  test "should require a follower_id" do
    @followingrelationship.follower_id = nil
    assert_not @followingrelationship.valid?
  end

  test "should require a followed_id" do
    @followingrelationship.followed_id = nil
    assert_not @followingrelationship.valid?
  end
end
