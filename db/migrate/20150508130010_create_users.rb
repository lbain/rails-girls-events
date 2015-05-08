class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :track
      t.integer :age
      t.boolean :previous_attendant
      t.text :programming_experience
      t.text :reason
      t.string :tshirt_size
      t.string :tshirt_color
      t.string :status

      t.timestamps null: false
    end
  end
end
