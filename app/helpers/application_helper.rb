module ApplicationHelper
  def on_events_page?
    if params[:controller] == 'events'
      true
    else
      false
    end
  end

  def on_restaurants_page?
    if params[:controller] == 'restaurants'
      true
    else
      false
    end
  end
end
