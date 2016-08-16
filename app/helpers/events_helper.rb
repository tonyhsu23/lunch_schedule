module EventsHelper
  def selected_month
    params[:month] ? params[:month].to_i : Date.today
  end

  def selected_category
    params[:category] ? params[:category].to_i : nil
  end

  def restaurants
    Restaurant.all.map do |restaurant|
      [restaurant.name, restaurant.id]
    end
  end

  def colleagues
    User.colleagues(current_user.company_id)
  end
end
