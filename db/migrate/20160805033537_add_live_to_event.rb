class AddLiveToEvent < ActiveRecord::Migration
  def change
    add_column :events, :live, :boolean
    Event.update_all(live: false)
  end
end
