class AddCognomeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cognome, :string
  end
end
