class Admin::DressesController < ApplicationController

  def index
     @dresses = Dress.all
    #@dresses = Dress.page(params[:page]).per(10)
  end

end
