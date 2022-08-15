# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#name_or_email' do
    assert_equal 'Alice', @alice.name_or_email
    @alice.name = ''
    assert_equal 'alice@example.com', @alice.name_or_email
  end

  test '#follow' do
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#unfollow' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)

    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
  end
end
