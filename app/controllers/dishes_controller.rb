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

  def destroy
    @dish = Dish.find(params[:id])
    @err_msg = nil

    respond_to do |format|
      if @dish.destroy
        format.js
      else
        @err_msg = t('views.actions.destroy_error')
        format.js
      end
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
