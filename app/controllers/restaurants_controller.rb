class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes.includes(:dish_category)
    @dish = Dish.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      unless @restaurant.save
        format.js { flash.now[:notice] = 'error' }
      end
      format.js
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :restaurant_category_id)
  end
end
