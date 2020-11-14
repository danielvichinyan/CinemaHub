require 'test_helper'
# The class ForumPostTest tests the validations of a Forum Post Model
# An initial setup is done so that the test can work correctly.
class ForumPostTest < ActiveSupport::TestCase

  # Initial setup
  # Setup a user (using fixtures/users.yml)
  # Setup a forum thread (using fixtures/forum_threads.yml)
  setup do
    @user = users(:one)
    @forum_thread = forum_threads(:one)
  end

  # All parameters passed correctly
  # Must save the forum post
  test "should save valid forum_post" do
    forum_post = ForumPost.new

    forum_post.user_id = @user.id
    forum_post.body = "This comment is a test comment."
    forum_post.user = @user
    forum_post.forum_thread = @forum_thread

    forum_post.save
    assert forum_post.valid?
  end

  # Forum Post body not long enough
  # Must not save invalid forum post
  test "should not save forum post with small body" do
    forum_post = ForumPost.new

    forum_post.user_id = @user.id
    forum_post.body = "Ye"
    forum_post.user = @user
    forum_post.forum_thread = @forum_thread

    forum_post.save
    refute forum_post.valid?
  end

  # Must not save invalid forum post
  # No parameters passed at all
  test "should not save invalid forum post" do
    forum_post = ForumPost.new
    forum_post.save
    refute forum_post.valid?
  end
end
