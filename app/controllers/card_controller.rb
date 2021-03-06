class CardController < ApplicationController
	before_action :set_card,only: %i(show edit update destroy)
    def new
			@card = Card.new
			@reservation = Reservation.find_by(id: params[:reservation_id])
		end

		def create
			@card = Card.new(card_params)
			if @card.save
				redirect_to :root
			else
				render action: :new
			end
		end

		def show
			render 'top'
		end

		def edit
			@reservations = Reservation.where(user: current_user)

		end

		def update
			if @card.update(card_params)
				redirect_to :root
			else
				render action: :edit
			end
		end

		def destroy
			@card.destroy
			redirect_to :root
		end
		
		
	
		private
			def card_params
				params.require(:card).permit(:title, :memo, :reservation_id)
			end

			def set_card
				@card = Card.find_by(id:params[:id])
			end
end
