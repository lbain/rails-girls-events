class AddDietaryRequirementsColJson < ActiveRecord::Migration
  def change
    add_column :users, :dietary_requirements, :json
  end
end
