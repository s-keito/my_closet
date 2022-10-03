class Public::DressesController < ApplicationController
  def new
  end

  def show
  end

  def index
  end

  def edit
  end

  private
  def dress_params
    params.require(:dress).permit(:image, :category, :caption)
  end


end
