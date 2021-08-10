class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render :"prototypes/show"
    end
  end

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comments = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in? == current_user.name
  end

end



