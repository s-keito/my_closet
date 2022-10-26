class Admin::DressesController < ApplicationController
  before_action :authenticate_admin!

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
    redirect_to admin_user_path(@dress.user)
    flash[:destroy] = '削除成功'
  end

  private

  def dress_params
    params.require(:dress).permit(:image, :category_id, :caption, :season_id, :is_status)
  end

end
