class RemoveImageColumnFromUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :image
  end
end
