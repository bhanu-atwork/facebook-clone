class AddUsersToFriend < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :relation
      t.timestamps
    end
    add_reference :friends, :user, null: false
    add_reference :friends, :user_friend, null: false
    add_foreign_key :friends, :users, column: :id

  end
end
