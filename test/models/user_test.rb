# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow' do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#following?' do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    me.follow(she)
    assert me.following?(she) # true
    assert_not she.following?(me) # false
    me.unfollow(she)
    assert_not me.following?(she) # true
  end

  test '#followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    me.follow(she)
    assert she.followed_by?(me) # true 正常系
    assert_not me.followed_by?(she) # false 異常系
    me.unfollow(she)
    assert_not she.followed_by?(me) # true 正常系
  end
end
