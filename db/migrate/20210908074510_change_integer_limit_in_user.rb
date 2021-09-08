class ChangeIntegerLimitInUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mobile_no, :bigint
  end
end
