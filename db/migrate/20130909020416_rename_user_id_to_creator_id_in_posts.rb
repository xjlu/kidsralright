class RenameUserIdToCreatorIdInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :user_id, :creator_id
    add_index :posts, :creator_id
  end
end
