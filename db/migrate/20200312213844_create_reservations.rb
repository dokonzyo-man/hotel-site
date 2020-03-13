class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :count
      t.integer :hotel_id

      t.timestamps
    end
  end
end
