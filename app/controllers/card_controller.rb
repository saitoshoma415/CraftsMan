class CardController < ApplicationController
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
	
		private
			def card_params
				params.require(:card).permit(:title, :memo, :reservation_id)
			end

end
