class RemoveColumnDietaryRequirements < ActiveRecord::Migration
  def change
    remove_column :users, :dietary_requirements
  end
end
