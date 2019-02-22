class CreateTastings < ActiveRecord::Migration[5.2]
  def change
    create_table :tastings do |t|
      t.string :location_name
      t.string :address
      t.date :date
      t.integer :user_id
      t.integer :experience_id
    end
  end
end
