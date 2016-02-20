class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id

      t.string :track
      t.boolean :over_18
      t.string :previous_attendance
      t.text :programming_experience
      t.text :reason
      t.string :tshirt_size
      t.string :admin_status
      t.string :user_status
      t.string :gender
      t.json :dietary_requirements
      t.text :extra_info

      t.timestamps null: false
    end
  end
end
