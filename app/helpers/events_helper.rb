module EventsHelper
  def restaurants
    Restaurant.all.map do |restaurant|
      [restaurant.name, restaurant.id]
    end
  end

  def colleagues
    User.colleagues(current_user.company_id)
  end
end
