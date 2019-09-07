class Unread < ApplicationRecord
  belongs_to :viewer, class_name: 'User',
                    foreign_key: 'user_id'


  belongs_to :news, class_name: 'Post',
                    foreign_key: 'post_id'



  validates_presence_of :user_id, :post_id
end
