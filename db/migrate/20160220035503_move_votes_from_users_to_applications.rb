class MoveVotesFromUsersToApplications < ActiveRecord::Migration
  def change
    rename_column :votes, :user_id, :application_id
  end
end
