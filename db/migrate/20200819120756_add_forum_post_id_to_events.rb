class AddForumPostIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :forum_post_id, :integer
  end
end
