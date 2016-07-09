module DishesHelper
  def dish_categories
    DishCategory.all.map do |dish|
      [dish.name, dish.id]
    end
  end

  def get_restaurant_id_params
    params[:restaurant]
  end
end
