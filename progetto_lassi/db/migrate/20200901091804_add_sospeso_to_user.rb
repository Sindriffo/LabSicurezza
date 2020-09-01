class AddSospesoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sospeso, :boolean, default:false
  end
end
