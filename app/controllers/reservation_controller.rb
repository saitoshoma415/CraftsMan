class ReservationController < ApplicationController
	def new
		@reservation = Reservation.new
	end
	
	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			redirect_to :root
		else
			render action: :new
		end
	end

	private
		def reservation_params
			params.require(:reservation).permit(:title).merge(user: current_user)
		end
end
