class LikesController < ApplicationController
  before_action lambda {
    redirect_to new_user_session_path unless user_signed_in?
  }, only: %i[create destroy]
  before_action :set_likable, only: %i[create destroy]

  def create
    current_user.like!(@likable)
  end

  def destroy
    current_user.likes.where(likable_id: @likable.id).delete_all
  end

  private

  def set_likable
    @likable =
      if params[:comment_id]
        Comment.find(params[:comment_id])
      elsif params[:post_id]
        Post.find(params[:post_id])
      else
        raise "Undefined :comment_id and :post_id params"
      end
  end
end
