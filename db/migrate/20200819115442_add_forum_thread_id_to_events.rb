class AddForumThreadIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :forum_thread_id, :integer
  end
end
