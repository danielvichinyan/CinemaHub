class AddAttachmentBannerToForumThreads < ActiveRecord::Migration[5.2]
  def self.up
    change_table :forum_threads do |t|
      t.attachment :banner
    end
  end
end
