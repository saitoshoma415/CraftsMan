class CreateReservations < ActiveRecord::Migration[6.1]
	def change
    create_table :contractors do |t|
      t.string :name
      t.string :company_name
      t.string :email_address
      t.timestamps
		end	

		create_table :orderers do |t|
			t.string :name
			t.string :company_name
      t.timestamps
    end
		

	def change
    create_table :reservations do |t|
			t.belongs_to :orderers
      t.belongs_to :contractors
      t.datetime :reservation_date
      t.timestamps
		end
		
  end
end
