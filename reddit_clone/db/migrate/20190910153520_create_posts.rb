class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :user_id
      t.integer :sub_id
    end
  end
end
