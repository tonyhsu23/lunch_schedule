module EventsHelper
  def restaurants
    Restaurant.all.map do |restaurant|
      [restaurant.name, restaurant.id]
    end
  end

  def dishes
    Dish.all.map do |dish|
      [dish.name, dish.id]
    end
  end
end
