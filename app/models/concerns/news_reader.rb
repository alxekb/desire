module NewsReader
  def mark_as_read(post, user)
    if Unread.find_by(user_id: user, post_id: post).nil?
      current_user.unreads.create(post_id: post)
    end
  end
end
