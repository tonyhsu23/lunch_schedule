class EventsController < ApplicationController
  def index
    @events = Event.dashboard(current_user)
  end

  def show
    @event = Event.includes(:users).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    dish_ids = params[:dish][:ids]
    dishes = Dish.where(id: dish_ids)

    user_ids = params[:users][:user_ids]
    users = User.where(id: user_ids)

    event = Event.new(event_params)
    event.users << users
    event.dishes = dishes

    if event.save
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
end
