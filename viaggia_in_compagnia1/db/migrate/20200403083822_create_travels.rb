class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
      t.string :nome
      t.string :citta_partenza
      t.string :citta_arrivo
      t.date :data
      t.time :ora_partenza
      t.time :ora_arrivo
      t.string :via_partenza
      t.string :via_arrivo
      t.string :telefono
      t.string :email
      t.float :prezzo
      t.integer :posti_disponibili

      t.timestamps
    end
  end
end
