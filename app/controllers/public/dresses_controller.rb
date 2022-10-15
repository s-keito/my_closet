class Public::DressesController < ApplicationController
  before_action :authenticate_user!

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
    @comment = Comment.new
  end

  def index
    #@posts = Post.published
    @seasons = Season.all
    @categories = Category.all
    @dresses = params[:name].present? ? Season.find(params[:name]).Category.find(params[:name]).where(is_status: true).dresses : Dress.where(is_status: true).order(created_at: :desc)
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

  private

  def dress_params
    params.require(:dress).permit(:image, :category_id, :caption, :name, :is_status, :season_id)
  end


end
