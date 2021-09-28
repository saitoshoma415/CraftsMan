class TopController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user).order("created_at ASC")
  end
end
