class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :telefono
      t.string :password
      t.integer :rating
      
      t.timestamps
    end
  end
end
