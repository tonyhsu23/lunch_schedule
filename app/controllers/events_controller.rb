class EventsController < ApplicationController
  def index
    @events = Event.my_events(current_user)
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

  def get_events_by_rc
    @events = Event.my_events_by_rc(current_user, params[:rest_cate_id])
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
