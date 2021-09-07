class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.timestamps
    end
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
