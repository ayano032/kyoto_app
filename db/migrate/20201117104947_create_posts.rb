class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :caption
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end