class ChangePriceTypeInReservations < ActiveRecord::Migration[6.1]
  def down
    change_column :reservations, :price, :decimal
  end

  def up
    change_column :reservations, :price, :integer
  end
end
