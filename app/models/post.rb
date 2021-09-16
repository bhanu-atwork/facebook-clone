class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :comments
  has_many :likes, as: :likeable
end