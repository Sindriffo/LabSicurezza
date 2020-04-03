class CreateMyTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :my_travels do |t|
      t.string :Nome
      t.string :Partenza
      t.string :Destinazione
      t.date :Data

      t.timestamps
    end
  end
end
