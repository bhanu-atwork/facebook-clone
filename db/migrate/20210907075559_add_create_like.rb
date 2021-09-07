class AddCreateLike < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.timestamps
    end
    add_reference :likes, :likeable, polymorphic: true, null: false
    add_reference :likes, :user, null: false, foreign_key: true
  end
end
