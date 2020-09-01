class CreateJoinedtravels < ActiveRecord::Migration[5.1]
  def change
    create_table :joinedtravels do |t|
      t.references 'user'
      t.references 'travel'
      t.boolean 'rated', default:false
      t.text 'review'
      t.timestamps
    end
  end
end
