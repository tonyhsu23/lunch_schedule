module RestaurantsHelper
  def restaurant_categories
    RestaurantCategory.all.map do |category|
      [category.name, category.id]
    end
  end

  def get_id_params
    params[:id]
  end
end
