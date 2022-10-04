class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @dresses = @user.dresses.order(created_at: :desc)
    # @seasons = Season.all
    # @dresses = params[:season_id].present? ? Season.find(params[:season_id]).dresses : Dress.all
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
end
