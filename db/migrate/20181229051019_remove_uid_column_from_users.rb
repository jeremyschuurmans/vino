class RemoveUidColumnFromUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :uid
  end
end
