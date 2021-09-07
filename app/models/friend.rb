class Friend < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'id'
  belongs_to :user_friend, :class_name => 'User', :foreign_key => 'id'
end