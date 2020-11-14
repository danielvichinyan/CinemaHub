require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # Get the home page of the web app (root_url)
  test "should get index" do
    get root_url
    assert_response :success
  end

  # Get the contact page of the web app 
  # home#contact
  test "should get contact" do
    get welcome_contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'CineHub'
    assert_select 'h2', 'Contact Us.'
    assert_select 'h3', 'Complete the following form to get in touch with us.'
  end

  # Get the about page of the web app 
  # home#about
  test "should get about" do
    get welcome_about_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'CineHub'
    assert_select 'h2', 'About Us.'
  end

end
