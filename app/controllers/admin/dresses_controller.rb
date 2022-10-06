class Admin::DressesController < ApplicationController

  def show
    @dress = Dress.find(params[:id])
    @comment = Comment.new
  end

  def index
     @dresses = Dress.all
    #@dresses = Dress.page(params[:page]).per(10)
  end

  def destroy
    @dress = Dress.find(params[:id])
    @dress.destroy
    redirect_to admin_user_path(@dress.user), notice: '投稿削除成功'
  end

  private

  def dress_params
    params.require(:dress).permit(:image, :category, :caption, :season_id, :name)
  end

end
