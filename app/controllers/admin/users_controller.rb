class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    #@users = User.all
    @users = User.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_user_path(@user)
    else
       render :edit
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :is_deleted)
  end

end
