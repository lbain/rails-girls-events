class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
