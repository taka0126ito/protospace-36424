class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]

  def show
    @user = User.find(params[:id])
    @prototypes = Prototype.includes(:user)
  end
end
