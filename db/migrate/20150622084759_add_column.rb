class AddColumn < ActiveRecord::Migration
  def change
    add_column :users, :extra_info, :text
  end
end
