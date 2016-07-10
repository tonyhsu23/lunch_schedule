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
    dish_ids = params[:event][:restaurant][:dish_ids]
    dishes = Dish.where(id: dish_ids)

    event = Event.create(event_params)
    event.users << current_user
    event.dishes = dishes

    if event.save
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :restaurant_id)
  end
end
