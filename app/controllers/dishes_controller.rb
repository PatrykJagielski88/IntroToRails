class DishesController < ApplicationController
  def index
    @dishes = Dish.includes(:category).all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def NotImplementedError

  end
end
