class RestaurantsController < ApplicationController
  def new
   @restaurant = Restaurant.new 
  end

  def create
    restaurant = Restaurant.create(restaurant_params)
    if restaurant.save
     redirect_to events_path
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :restaurant_category_id)
  end
end
