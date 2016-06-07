class DashboardController < ApplicationController
  def index
    Event.dashboard(current_user)
  end
end
