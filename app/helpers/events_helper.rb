module EventsHelper
  def restaurants
    Restaurant.all.map do |restaurant|
      [restaurant.name, restaurant.id]
    end
  end
end
