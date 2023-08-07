class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"
  end

private
  def comment_params
  params.require(:comment).permit(:content).merge(prototype: Prototype.find(params[:prototype_id]), user_id: current_user.id)
  end
end