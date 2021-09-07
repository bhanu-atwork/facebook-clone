class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last
      t.string :_name
      t.string :dob
      t.string :date
      t.string :password
      t.string :email
      t.integer :mobile_no
      t.text :about

      t.timestamps
    end
  end
end
