# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  username               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'test_helper'

# The class UserTest tests the validations of a User Model
class UserTest < ActiveSupport::TestCase
  # No parameters at all
  # Must not save invalid user
  test "should not save invalid user" do
    user = User.new
    user.save
    refute user.valid?
  end

  # All parameters passed correctly
  # Must save user
  test "should save valid user" do
    user = User.new
    user.username = "testusername"
    user.email = "bob@example.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.age = 18
    user.save
    assert user.valid?
  end

  # Users have duplicate emails
  # Must not save user2
  test "should not save duplicate user email" do
    user1 = User.new
    user1.username = "testusername"
    user1.email = "dan@example.com"
    user1.password = "123456"
    user1.password_confirmation = "123456"
    user1.age = 18
    user1.save
    assert user1.valid?

    user2 = User.new
    user2.username = "testusername12"
    user2.email = "dan@example.com"
    user2.password = "123456"
    user2.password_confirmation = "123456"
    user2.age = 18
    user2.save
    refute user2.valid?
  end

  # Users have duplicate usernames
  # Must not save user2
  test "should not save duplicate user username" do
    user1 = User.new
    user1.username = "testusername"
    user1.email = "dan12@example.com"
    user1.password = "123456"
    user1.password_confirmation = "123456"
    user1.age = 18
    user1.save
    assert user1.valid?

    user2 = User.new
    user2.username = "testusername"
    user2.email = "dan@example.com"
    user2.password = "123456"
    user2.password_confirmation = "123456"
    user2.age = 18
    user2.save
    refute user2.valid?
  end

  # User is underage (<13 years)
  # Must not save user
  test "should not save underage user" do
    user = User.new
    user.username = "testusername"
    user.email = "bob@example.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.age = 11
    user.save
    refute user.valid?
  end

  # User has too short password
  # Must not save user
  test "should not save user with a short password" do
    user = User.new
    user.username = "testusername"
    user.email = "bob@example.com"
    user.password = "123"
    user.password_confirmation = "123"
    user.age = 18
    user.save
    refute user.valid?
  end
end
