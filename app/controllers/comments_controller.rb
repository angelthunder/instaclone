class CommentsController < ApplicationController
  before_action lambda {
    redirect_to new_user_session_path unless user_signed_in?
  }, only: %i[create]

  def new; end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = @post
    comment.user = current_user

    render :new, status: :unprocessable_entity unless comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
