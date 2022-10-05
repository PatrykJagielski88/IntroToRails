class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
# def index
#   @dishes = Dish.includes(:category).all
# end

# def show
#   @dish = Dish.find(params[:id])
# end
