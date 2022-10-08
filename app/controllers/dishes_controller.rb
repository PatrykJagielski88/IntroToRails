class DishesController < ApplicationController
  def index
    @dishes = Dish.page(params[:page]).includes(:category).all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"

    @dishes_s = if params[:category_id] == ''
                  Dish.page(params[:page]).where('name LIKE ?', wildcard_search)
                else
                  Dish.page(params[:page]).where('name LIKE ? and category_id LIKE ?', wildcard_search,
                                                 params[:category_id])
                end

    # @paginatable_array = Kaminari.paginate_array(@category.dishes).page(params[:page]), params[:category_id]
  end
end
