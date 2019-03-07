class AddWineIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :wine_id, :integer
  end
end
