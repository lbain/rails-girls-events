class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :users, :tshirt_color
  end
end
