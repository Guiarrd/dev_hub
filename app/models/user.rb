class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :posts
  has_many :likes

  acts_as_followable
  acts_as_follower

  validates :name, :description, presence: true
end
