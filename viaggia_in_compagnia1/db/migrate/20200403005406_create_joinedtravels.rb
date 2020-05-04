class CreateJoinedtravels < ActiveRecord::Migration[5.1]
  def change
    create_table :joinedtravels do |t|
      t.references 'user'
      t.references 'travel'
      t.integer 'rating'
      t.text 'review'
      t.timestamps
    end
  end
end
