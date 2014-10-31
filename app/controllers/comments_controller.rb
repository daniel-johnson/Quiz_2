class CommentsController < ApplicationController

  def create
    @idea = Idea.find params[:idea_id]
    @comment = Comment.new comment_params
    @comment.idea = @idea
    @comment.user = current_user
    if @comment.save
      redirect_to @idea, notice: "Comment Created"
    else
      redirect_to @idea, alert: "Comment not Created"
    end
  end

  def destroy

    # @idea = Idea.find params[:idea_id]
    # @comment = Comment.find params[:id]
    # if @comment.destroy
  end



  private

  def comment_params
    # will give back something like {body: "abcd"}
    params.require(:comment).permit(:body)
  end
end
