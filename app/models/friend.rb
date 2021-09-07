class Friend < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'first_user_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'second_user_id'
  enum status: { active: 0, blocked: 1, inactive: 2 }
end