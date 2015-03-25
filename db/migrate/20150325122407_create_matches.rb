class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_player_id
      t.integer :second_player_id
      t.integer :first_player_score
      t.integer :second_player_score
      t.date :date

      t.timestamps null: false
    end
  end
end
