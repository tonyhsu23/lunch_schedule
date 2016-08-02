module ApplicationHelper
  def flash_class(level)
    case level
    when "notice" then "success"
    when "error" then "danger"
    when "alert" then "warning"
    end
  end

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
