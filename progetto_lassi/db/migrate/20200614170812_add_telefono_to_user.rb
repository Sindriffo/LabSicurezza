class AddTelefonoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :telefono, :string
    add_column :users, :segnalato, :integer, default:0
    add_column :users, :nome, :string
    add_column :users, :cognome, :string
    add_column :users, :rating, :integer, default:nil
    add_column :users, :ratingnum, :integer, default:0 
    add_column :users, :sospeso, :boolean, default:false
    add_column :users, :admin, :boolean, default:false
  end
end
