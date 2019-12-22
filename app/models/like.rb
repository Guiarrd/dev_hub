class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, uniqueness: { scope: :user, message: "Você já curtiu este post" }
  validates :post, :user, presence: true
end
