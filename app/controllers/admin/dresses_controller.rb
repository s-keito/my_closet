class Admin::DressesController < ApplicationController

  def show
    @dress = Dress.find(params[:id])
    @comment = Comment.new
  end

  def index
     @dresses = Dress.all
  end

  def destroy
    @dress = Dress.find(params[:id])
    @dress.destroy
    redirect_to admin_dresses_path
    flash[:destroy] = '削除成功'
  end

  private

  def dress_params
    params.require(:dress).permit(:image, :category, :caption, :season_id, :name)
  end

end
