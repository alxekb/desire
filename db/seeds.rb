6.times { FactoryBot.create(:post) } if Post.count.nil?
User.all.each do |user|
  rand(12).times { FactoryBot.create :post, user_id: user.id }
end
