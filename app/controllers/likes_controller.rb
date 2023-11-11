class LikesController < ApplicationController
  before_action lambda {
    redirect_to new_user_session_path unless user_signed_in?
  }, only: :create

  def create
    @post = Post.find(params[:post_id])
    current_user.like!(@post)
  end
end
