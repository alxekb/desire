class User < ApplicationRecord
  has_many :unreads
  has_many :posts, through: :unreads
end
