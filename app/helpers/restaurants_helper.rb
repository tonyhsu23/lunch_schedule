module RestaurantsHelper
  def restaurant_categories
    RestaurantCategory.all.map do |category|
      [category.name, category.id]
    end
  end
end
