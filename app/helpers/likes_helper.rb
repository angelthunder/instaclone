module LikesHelper
  def liked?(post)
    current_user&.liked?(post)
  end
end
