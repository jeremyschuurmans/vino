class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :winery
      t.string :vintage
      t.string :origin
      t.string :price
      t.integer :rating
      t.text :tasting_notes
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :wines, [:user_id, :created_at]
  end
end
