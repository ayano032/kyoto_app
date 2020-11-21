class AddProfielImageIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ProfielImageId, :integer
  end
end
