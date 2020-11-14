class Event < ApplicationRecord
  after_create_commit { EventBroadcastJob.perform_later self }

  # belongs_to :forum_thread
  # belongs_to :forum_post
end
