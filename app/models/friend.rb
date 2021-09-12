class Friend < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'first_user_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'second_user_id'
  enum status: { accept: 0, reject: 1, block: 2, remove:3}
  validates_uniqueness_of :first_user_id, scope: :second_user_id
end