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

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=38"
  end
end
