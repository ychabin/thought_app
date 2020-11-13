class CommentsController < ApplicationController

  def create
    @thought = Thought.find(params[:thought_id])
    @comment = @thought.comments.build(comment_params)
    if @comment.save
      redirect_to thought_path(@comment.thought)
    else
      render "thoughts/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, thought_id: params[:thought_id])
  end
end
