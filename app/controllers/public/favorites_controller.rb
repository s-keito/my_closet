class Public::FavoritesController < ApplicationController
  def create
    dress = Dress.find(params[:dress_id])
    favorite = current_user.favorites.new(dress_id: dress.id)
    favorite.save
    redirect_to dress_path(dress)
  end

  def destroy
    dress = Dress.find(params[:dress_id])
    favorite = current_user.favorites.find_by(dress_id: dress.id)
    favorite.destroy
    redirect_to dress_path(dress)
  end

end
