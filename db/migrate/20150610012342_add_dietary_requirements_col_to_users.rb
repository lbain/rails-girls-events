class AddDietaryRequirementsColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dietary_requirements, :string
  end
end
