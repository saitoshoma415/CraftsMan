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

	def edit
		@reservation = Reservation.find_by(id:params[:id])
	end

	def update
		@reservation = Reservation.find_by(id:params[:id])
		if @reservation.update_attributes(reservation_params)
			redirect_to :root
		else
			render action: :edit
		end
	end

	private
		def reservation_params
			params.require(:reservation).permit(:title).merge(user: current_user)
		end
end
