class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
      t.references 'user'
            
      t.string :partenza
      t.string :area_partenza
      t.string :arrivo
      t.string :area_arrivo
      t.date :data
      t.time :ora_partenza
      t.float :prezzo
      t.integer :posti_disponibili
      t.boolean :rated, default:false
      t.timestamps
    end
  end
end
