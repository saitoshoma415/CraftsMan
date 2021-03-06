class ReservationController < ApplicationController
	before_action :set_reservation,only: %i(edit update destroy)

	def new
		@reservation = Reservation.new
	end
	
	def create
		 @reservation = Reservation.new(reservation_params)
		 if @reservation.save
		 	redirect_to :root
		# else
		# 	render action: :new
		 end
	end

	def edit
	end

	def update
		@reservation = Reservation.find_by(id:params[:id])
		if @reservation.update(reservation_params)
			redirect_to :root
		else
			render action: :edit
		end
	end

	def destroy
		@reservation.destroy
		redirect_to :root
	end

	private
		def reservation_params
			params.require(:reservation).permit(:title).merge(user: current_user)
		end
		def set_reservation
			@reservation = Reservation.find_by(id: params[:id])
		end
end
