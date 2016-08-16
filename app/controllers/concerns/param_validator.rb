module ParamValidator
  def get_month
    params[:month].nil? ? Date.today.month : params[:month]
  end

  def get_restaurant_category_id
    if params[:category].nil?
      false
    elsif params[:category] == "false"
      false
    else
      params[:category]
    end
  end

  def get_page
    params[:page].nil? ? 1 : params[:page]
  end
end
