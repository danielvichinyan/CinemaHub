require 'test_helper'
# The class ForumThreadTest tests the validations of a Forum Thread Model
# An initial setup is done so that the test can work correctly.
class ForumThreadTest < ActiveSupport::TestCase

  # Initial setup
  # Setup a user (using fixtures/users.yml) so that we can create forum threads
  setup do
    @user = users(:one)
  end

  # Must not save empty forum thread
  test 'should not save empty forum thread' do
    forum_thread = ForumThread.new

    forum_thread.save
    refute forum_thread.valid?
  end

  # All parameters are entered correctly
  # MUST save the forum thread
  test "should save valid forum thread" do
    forum_thread = ForumThread.new

    forum_thread.subject = "My Forum thread"
    forum_thread.message = "This forum thread is a test forum thread."
    forum_thread.banner_file_name = "testBanner"
    forum_thread.user_id = @user.id
    forum_thread.save
    assert forum_thread.valid?
  end

  # No forum thread subject
  # Must not save forum thread
  test "should not save forum thread with empty subject" do
    forum_thread = ForumThread.new

    forum_thread.subject = ""
    forum_thread.message = "This forum thread is a test forum thread."
    forum_thread.banner_file_name = "testBanner"
    forum_thread.user_id = @user.id
    forum_thread.save
    refute forum_thread.valid?
  end

  # Subject not long enough
  # Must not save forum thread
  test "should not save forum thread with a small subject" do
    forum_thread = ForumThread.new

    forum_thread.subject = "Ye"
    forum_thread.message = "This forum thread is a test forum thread."
    forum_thread.banner_file_name = "testBanner"
    forum_thread.user_id = @user.id
    forum_thread.save
    refute forum_thread.valid?
  end

  # Forum thread description not long enough
  # Must not save forum thread
  test "should not save forum thread with a small description" do
    forum_thread = ForumThread.new

    forum_thread.subject = "MyPodcast"
    forum_thread.message = "Ya"
    forum_thread.banner_file_name = "testBanner"
    forum_thread.user_id = @user.id
    forum_thread.save
    refute forum_thread.valid?
  end

  # Forum thread with an empty description
  # Must not save forum thread
  test "should not save forum thread with an empty description" do
    forum_thread = ForumThread.new

    forum_thread.subject = "My ForumThread"
    forum_thread.message = ""
    forum_thread.banner_file_name = "testBanner"
    forum_thread.user_id = @user.id
    forum_thread.save
    refute forum_thread.valid?
  end
end
