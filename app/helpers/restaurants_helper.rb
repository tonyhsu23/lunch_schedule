module RestaurantsHelper
  def restaurant_categories
    RestaurantCategory.all.map do |category|
      [category.name, category.id]
    end
  end

  def id_param
    params[:id]
  end
end
