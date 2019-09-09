class User < ApplicationRecord
  has_many :unreads, dependent: :destroy
  has_many :news, through: :unreads,
                  class_name: 'Post',
                  foreign_key: 'post_id'

  has_many :posts, inverse_of: 'author', dependent: :destroy




  validates :login, presence: true, length: { minimum: 3 },
                    uniqueness: { cast_sensitive: false }
  validates :password_digest, presence: true
  validates :signature, :name, presence: true

  before_create :generate_token
  has_secure_password

  private

  def generate_token
    self.token = SecureRandom.base64(64)
  end
end
