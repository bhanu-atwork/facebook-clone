class AddUsersToFriend < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :status
      t.timestamps
    end
    add_reference :friends, :first_user, null: false
    add_reference :friends, :second_user, null: false
    add_foreign_key :friends, :users, column: :first_user_id
    add_foreign_key :friends, :users, column: :second_user_id

  end
end
