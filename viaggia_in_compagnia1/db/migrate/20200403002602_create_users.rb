class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :Nome
      t.string :Cognome
      t.string :Email
      t.string :Password

      t.timestamps
    end
  end
end
