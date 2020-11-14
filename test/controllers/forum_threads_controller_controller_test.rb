require 'test_helper'

# The class ForumThreadsControllerControllerTest tests the functionality of a Forum Thread Controller
# An initial setup is done so that the test can work correctly.
class ForumThreadsControllerControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Initial setup
  # Setup a forum_thread (using fixtures/forum_threads.yml) so that we can create forum threads
  # Setup a user (using fixtures/users.yml)
  # Sign in with user(one) in order to have access to the forum page and be able to create forum threads
  setup do
    @forum_thread = forum_threads(:one)
    @user = users(:one)
    @user.save
    sign_in @user
  end

  # Get the index page of the forum (forum_threads_url)
  test "should get index" do
    get forum_threads_url
    assert_response :success
  end

  # Get the page of a particular forum thread
  test "should show forum thread" do
    get forum_thread_url(@forum_thread)
    assert_response :success
  end

  # Get the create forum thread page
  test "should get new" do
    get new_forum_thread_url
    assert_response :success
  end

  # Tests whether a forum thread is created
  # Passing necessary parameters
  test "should create forum thread" do
    assert_difference('ForumThread.count') do
      post forum_threads_url, params: { forum_thread: { message: @forum_thread.message, subject: @forum_thread.subject } }
    end
  end

  # Get the edit forum thread page of a particular forum thread
  test "should get edit" do
    get edit_forum_thread_url(@forum_thread)
    assert_response :success
  end

  # Tests whether a forum thread is updated successfully
  # Passing necessary parameters
  test "should update forum thread" do
    patch forum_thread_url(@forum_thread), params: { forum_thread: { message: @forum_thread.message, subject: @forum_thread.subject } }
    assert_redirected_to forum_thread_url(@forum_thread)
  end

  # Tests whether a forum thread is deleted successfully
  test "should destroy forum_thread" do
    assert_difference('ForumThread.count', -1) do
      delete forum_thread_url(@forum_thread)
    end

    assert_redirected_to forum_threads_url
  end
end
