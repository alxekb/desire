class Post < ApplicationRecord
  has_many :unreads, dependent: :destroy
  has_many :viewers, through: :unreads,
                     class_name: 'User',
                     foreign_key: 'user_id'

  belongs_to :author, class_name: 'User',
  foreign_key: 'user_id'





  validates :notice, :content, :published,
            :title, :user_id, presence: true
end
