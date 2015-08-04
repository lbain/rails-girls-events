class RenameCommentAdmin < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :admin_id
  end
end
