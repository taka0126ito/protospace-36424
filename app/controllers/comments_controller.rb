class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    redirect_to prototypes_path

    else
      render.new
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
end



