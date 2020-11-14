# The class ForumPost provides validations and associations for the Forum Post Model
# The validations and associations are tested in test/models/forum_post_test.rb
class ForumPost < ApplicationRecord
    after_create_commit { create_event }
    belongs_to :forum_thread
    belongs_to :user

    has_many :events, :dependent => :destroy

    # Forum Post MUST have a body with a minimum length of 5 letters
    validates :body, presence: true, length: {minimum: 5}
    
    def create_event
      Event.create message: user.username + " posted a comment on your forum thread '" + forum_thread.subject + "'."
    end
end
