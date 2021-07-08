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
    assert me.following?(she)
    assert_not she.following?(me)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    me.follow(she)
    assert she.followed_by?(me)
    assert_not me.followed_by?(she)
    me.unfollow(she)
    assert_not she.followed_by?(me)
  end
end
