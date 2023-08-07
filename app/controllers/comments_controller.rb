class CommentsController < ApplicationController
<<<<<<< HEAD
  # def new
  #   @commment = Comments.new
  # end
  
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"
  end  

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
=======
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"
  end

private
  def comment_params
  params.require(:comment).permit(:content).merge(prototype: Prototype.find(params[:prototype_id]), user_id: current_user.id)
  end
end
>>>>>>> 054ce1582a744c09f4fec172999db371f87a47e7
