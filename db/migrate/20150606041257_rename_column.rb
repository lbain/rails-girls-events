class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :users, :previous_attendant, :previous_attendance
  end
end
