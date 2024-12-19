class AddPieceRefToScores < ActiveRecord::Migration[7.2]
  def change
    add_reference :scores, :piece, null: false, foreign_key: true
  end
end
