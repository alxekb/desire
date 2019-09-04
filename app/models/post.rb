class Post < ApplicationRecord
  belongs_to :user
  has_many :unreads
  has_many :users, through: :unreads

  validates :notice, :content, :published,
            :title, :user_id, presence: true
end
