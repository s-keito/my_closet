class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :set_user, only: [:favorites]

  def show
    @user = User.find(params[:id])
    @seasons = Season.all

    if @user == current_user
      @count = @user.dresses.count
      @dresses = params[:name].present? ? Season.find(params[:name]).dresses : @user.dresses.order(created_at: :desc)
    else
      @count = @user.dresses.where(is_status: true).count
      @dresses = params[:name].present? ? Season.find(params[:name]).dresses : @user.dresses.where(is_status: true).order(created_at: :desc)
    end

  end

  def index
    #@users = User.all.order(created_at: :desc)
    @users = User.page(params[:page]).per(5).order(created_at: :desc)
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

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def unsubscribe
  end

  def withdrawal
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    redirect_to root_path, notice: '退会処理を実行いたしました'
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:dress_id)
    @favorite_dresses = Dress.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image, :is_deleted)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
