class AddApplicationEventAssociation < ActiveRecord::Migration
  def change
    add_column :applications, :event_id, :integer
  end
end
