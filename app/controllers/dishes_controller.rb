class DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def create
    restaurant_id = params[:dish][:restaurant_id]
    dish = Dish.create(dish_params)

    if dish.save
      redirect_to restaurant_path(restaurant_id)
    else
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :price, :dish_category_id, :restaurant_id)
  end
end
