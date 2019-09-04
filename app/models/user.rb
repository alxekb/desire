class User < ApplicationRecord
  has_many :unreads
  has_many :posts, through: :unreads
  validates :login, presence: true, length: { minimum: 3}, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :signature, :name, presence: true
end
