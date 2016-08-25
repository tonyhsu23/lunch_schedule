class DishesController < ApplicationController
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      unless @dish.save && upload_image
        format.js { flash.now[:notice] = 'error' }
      end
      format.js
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :price, :dish_category_id, :restaurant_id)
  end

  def upload_image
    @dish.create_dish_image(params[:dish][:image])
  end
end
