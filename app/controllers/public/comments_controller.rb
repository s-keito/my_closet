class Public::CommentsController < ApplicationController
  def create
    dress = Dress.find(params[:dress_id])
    comment = current_user.comments.new(comment_params)
    comment.dress_id = dress.id
    comment.save
    redirect_to dress_path(dress)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to dress_path(params[:dress_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
