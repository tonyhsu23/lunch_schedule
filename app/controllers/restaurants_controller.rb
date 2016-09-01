class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.by_company(current_user.company.id)
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = find_restaurant
    @dishes = @restaurant.dishes.includes(:dish_category, :dish_images)
    @dish = Dish.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.add_company(current_user.company)

    respond_to do |format|
      unless @restaurant.save
        format.js { flash.now[:notice] = 'error' }
      end
      format.js
    end
  end

  def edit
    @restaurant = find_restaurant
  end

  def update
    @restaurant = find_restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path,
        flash: { notice: t('activerecord.update_success') }
    else
      render :edit
    end
  end

  def destroy
    @restaurant = find_restaurant
    if @restaurant.destroy
      redirect_to restaurants_path,
        flash: { notice: t('activerecord.destroy_success') }
    else
      render :edit
    end
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :restaurant_category_id)
  end
end
