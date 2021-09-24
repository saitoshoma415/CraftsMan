class Reservation < ApplicationRecord
	belongs_to :orderer
	belongs_to :contractor
end
