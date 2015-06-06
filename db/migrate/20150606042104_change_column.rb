class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :users, :previous_attendance, :string
  end
end
