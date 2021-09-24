class CreateOrderers < ActiveRecord::Migration[6.1]
  def change
    create_table :orderers do |t|

      t.timestamps
    end
  end
end
