class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :my_hand
      t.string :com_hand

      t.timestamps
    end
  end
end
