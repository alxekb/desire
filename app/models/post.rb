class Post < ApplicationRecord
  belongs_to :user
  has_many :unreads
  has_many :users, through: :unreads

  validates :notice, presence: true
  validates :content, presence: true
  validates :published, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
end
