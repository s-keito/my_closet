class Public::DressesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_dress,only: [:edit, :update]


   def new
    @dress = Dress.new
   end

  def create
    @dress = Dress.new(dress_params)
    @dress.user_id = current_user.id
    if @dress.save
      flash[:success] = "新規投稿に成功しました！"
      redirect_to user_path(@dress.user)
    else
      render 'new'
    end
  end

  def show
    @dress = Dress.find(params[:id])
   if @dress.user == current_user
    @comment = Comment.new
   else
    if @dress.is_status == true
     @comment = Comment.new
    else
     redirect_to user_path(current_user)
    end
   end
  end

  def index
    @seasons = Season.all
    @categories = Category.all

    if params[:name].present?
      @dresses = Season.find(params[:name]).dresses.where(is_status: true)
    elsif params[:kind].present?
      @dresses = Category.find(params[:kind]).dresses.where(is_status: true)
    else
      @dresses = Dress.where(is_status: true).order(created_at: :desc)
    end
  end

  def edit
    @dress = Dress.find(params[:id])
  end

  def update
    @dress = Dress.find(params[:id])
    if @dress.update(dress_params)
      flash[:success] = "投稿編集に成功しました！"
      redirect_to dress_path(@dress)
    else
      render "edit"
    end
  end

  def destroy
    @dress = Dress.find(params[:id])
    @dress.destroy
    redirect_to user_path(@dress.user)
  end

  def correct_dress
        @dress= Dress.find(params[:id])
    unless @dress.user.id == current_user.id
      redirect_to user_path(current_user)
    end
end

  private

  def dress_params
    params.require(:dress).permit(:image, :category_id, :is_status, :season_id, :caption)
  end


end
