class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
      t.string :NomeUtente
      t.string :CittaPartenza
      t.string :CittaArrivo
      t.date :Data
      t.time :OraPartenza
      t.time :OraArrivo
      t.string :ViaPatenza
      t.string :ViaArrivo
      t.string :Telefono
      t.string :Email
      t.float :Costo

      t.timestamps
    end
  end
end
