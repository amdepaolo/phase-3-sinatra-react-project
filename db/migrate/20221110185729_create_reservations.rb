class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.datetime :check_out
      t.datetime :check_in
      t.timestamps
    end
  end
end
