class AddUnder18ColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :under_18, :boolean
  end
end