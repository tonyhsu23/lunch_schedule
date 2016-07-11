class DishesController < ApplicationController
  def create
    restaurant_id = params[:dish][:restaurant_id]
    @dish = Dish.new(dish_params)

    respond_to do |format|
      unless @dish.save
        format.js { flash.now[:notice] = 'error' }
      end
      format.js
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :price, :dish_category_id, :restaurant_id)
  end
end
