class User < ApplicationRecord
  validates :first_name, presence: true 
  validates :password, presence: true, length: { minimum: 6 }
  validates :email,  presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :mobile_no, presence:true , numericality: true, length: { is: 10 }
  has_many :posts
  has_many :comments
  has_many :likes
end
