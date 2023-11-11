class LikesController < ApplicationController
  before_action lambda {
    redirect_to new_user_session_path unless user_signed_in?
  }, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]

  def create
    current_user.like!(@post)
  end

  def destroy
    current_user.likes.where(post_id: @post.id).delete_all
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
