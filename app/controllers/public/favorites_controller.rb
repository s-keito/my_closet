class Public::FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @dress = Dress.find(params[:dress_id])
    favorite = current_user.favorites.new(dress_id: @dress.id)
    favorite.save
  end

  def destroy
    @dress = Dress.find(params[:dress_id])
    favorite = current_user.favorites.find_by(dress_id: @dress.id)
    favorite.destroy
  end

end
