class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, length: { minimum: 6, maximum:30}
  has_many :likes as: :likeable
end