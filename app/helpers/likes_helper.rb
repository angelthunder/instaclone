module LikesHelper
  def liked?(likable)
    current_user&.liked?(likable)
  end

  def likable_path(likable)
    if likable.is_a?(Post)
      post_likes_path(likable)
    elsif likable.is_a?(Comment)
      post_comment_likes_path(likable.post, likable)
    else
      raise "Undefined likable_path for #{likable.class}"
    end
  end
end
