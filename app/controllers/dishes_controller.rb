class DishesController < ApplicationController
  def index
    @dishes = Dish.page(params[:page]).includes(:category).all
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
