class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :white_player
      t.references :black_player
      t.string :fen
      t.text :pgn, limit: 1024 * 1024
      t.string :type, index: true
      t.timestamps
    end
  end
end
