class Post < ApplicationRecord
  belongs_to :user
  has_many :unreads, dependent: :destroy
  has_many :users, through: :unreads

  validates :notice, :content, :published,
            :title, :user_id, presence: true
end
