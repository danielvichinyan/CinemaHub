# The class ForumThread provides validations and associations for the Forum Thread Model
# The validations and associations are tested in test/models/forum_thread_test.rb
class ForumThread < ApplicationRecord
    after_create_commit { create_event }
    belongs_to :user

    # Forum Thread has many comments
    # If a forum thread is deleted, all comments in it are also deleted
    has_many :forum_posts, :dependent => :destroy
    # If a forum thread is deleted, delete all events related to it
    has_many :events, :dependent => :destroy

    accepts_nested_attributes_for :forum_posts

    # Forum thread MUST have a subject with a minimum length of 5 letters
    validates :subject, presence: true, length: {minimum: 5}
    # Forum thread MUST have a message with a minimum length of 5 letters
    validates :message, presence: true, length: {minimum: 5}

    validates_associated :forum_posts

    # Thumbnail upload
    has_attached_file :banner
    # The banner is of type image
    validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/

    def create_event
      Event.create message: user.username + " posted a new thread '" + subject + "' in the forum." 
    end
end
