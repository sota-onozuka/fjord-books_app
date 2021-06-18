require "test_helper"

class FollowingRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get following_relationships_follow_url
    assert_response :success
  end
end
