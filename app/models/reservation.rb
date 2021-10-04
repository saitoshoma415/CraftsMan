class Reservation < ApplicationRecord
	# belongs_to :orderer
	# belongs_to :contractor
	  belongs_to :user
		has_many :cards, dependent: :destroy
	validates :title, length: { in: 1 ..255 }
end
