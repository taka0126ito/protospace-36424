class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.all
  end
  
  def new
 @prototype = Prototype.new
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save
      redirect_to prototype_path
    else
      render :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        render :new
      end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
end
end