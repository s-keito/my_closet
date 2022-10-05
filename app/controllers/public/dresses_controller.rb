class Public::DressesController < ApplicationController

   def new
    @dress = Dress.new
   end

  def create
    @dress = Dress.new(dress_params)
    @dress.user_id = current_user.id
    if @dress.save
      redirect_to user_path(@dress.user), notice: "You have created book successfully."
    else
      render 'new'
    end
  end

  def show
    @dress = Dress.find(params[:id])
    @comment = Comment.new
  end

  def index
    @seasons = Season.all
    @dresses = params[:name].present? ? Season.find(params[:name]).dresses : Dress.all.order(created_at: :desc)
  end

  def edit
    @dress = Dress.find(params[:id])
  end

  def update
    @dress = Dress.find(params[:id])
    if @dress.update(dress_params)
      redirect_to dress_path(@dress), notice: "You have updated book successfully."
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
    params.require(:dress).permit(:image, :category, :caption, :season_id, :name)
  end


end
