class Friend < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'first_user_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'second_user_id'
  enum status: { accepted: 0, rejected: 1, blocked: 2, removed:3}
  # validates_uniqueness_of :first_user_id, scope: :second_user_id
end