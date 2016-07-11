module DishesHelper
  def dish_categories
    DishCategory.all.map do |dish|
      [dish.name, dish.id]
    end
  end
end
