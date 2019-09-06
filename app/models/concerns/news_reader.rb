module NewsReader
  def mark_as_read(post, user)
    if Unread.find_by(user_id: user, post_id: post).nil?
      current_user.unreads.create(post_id: post)
    end
  end

  def subtract_news(posts, user)
    posts.each do |post|
      post.id == Unread.where('user_id = ?', user)
    end
  end
end
