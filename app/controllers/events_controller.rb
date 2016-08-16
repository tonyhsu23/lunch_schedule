class EventsController < ApplicationController
  include ParamValidator

  def index
    month = get_month
    page = get_page
    restaurant_category_id = get_restaurant_category_id

    @events = Event.my_events_on_condition(
      current_user,
      restaurant_category_id,
      month
    ).page(page)
  end

  def company_index
    month = get_month
    page = get_page
    restaurant_category_id = get_restaurant_category_id

    @events = Event.company_events_on_condition(
      current_user,
      restaurant_category_id,
      month
    ).page(page)
  end

  def show
    @event = Event.includes(:users).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    if make_event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def get_rest_dishes
    @dishes = Dish.where(restaurant_id: params[:restaurant_id])
  end

  private

  def event_params
    params.require(:event).permit(:date, :restaurant_id)
  end

  def make_event
    event = Event.new(event_params)
    event.add_participants(param_users)
    event.add_dishes(param_dishes)
    event
  end

  def param_dishes
    Dish.where(id: params[:dish][:ids])
  end

  def param_users
    User.where(id: params[:users][:user_ids])
  end
end
