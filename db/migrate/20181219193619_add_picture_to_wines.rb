class AddPictureToWines < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :picture, :string
  end
end
