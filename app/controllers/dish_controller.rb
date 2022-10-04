class DishController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
# def index
#   @products = Product.includes(:category).all
# end

# def show
#   @product = Product.find(params[:id])
# end
