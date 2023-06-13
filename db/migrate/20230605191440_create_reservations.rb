class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.decimal :price
      t.integer :headcount
      t.integer :room_id
      t.string :user_id

      t.timestamps
    end
  end
end
