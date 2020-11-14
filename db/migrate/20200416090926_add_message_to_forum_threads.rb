class AddMessageToForumThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :message, :text
  end
end
