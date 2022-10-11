class Public::CommentsController < ApplicationController
  def create
    dress = Dress.find(params[:dress_id])
    @comment = current_user.comments.new(comment_params)
    @comment.dress_id = dress.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
