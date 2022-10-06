class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).all
  end

  def show
    @category = Category.find(params[:id])
    # @cat = @category.page(params[:page]).all
    @paginatable_array = Kaminari.paginate_array(@category.dishes).page(params[:page])
  end
end
# def index
#   @dishes = Dish.includes(:category).all
# end

# def show
#   @dish = Dish.find(params[:id])
# end
