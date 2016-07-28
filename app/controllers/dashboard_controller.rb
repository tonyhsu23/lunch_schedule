class DashboardController < ApplicationController
  def index
    @events = Event.dashboard(current_user)
  end
end
