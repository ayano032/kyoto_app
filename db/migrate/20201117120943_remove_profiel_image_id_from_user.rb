class RemoveProfielImageIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :ProfielImageId, :integer
  end
end
