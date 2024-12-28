class CreatePiecesRecordings < ActiveRecord::Migration[7.2]
  def change
    create_table :pieces_recordings, id: false do |t|
      t.belongs_to :piece, index: true
      t.belongs_to :recording, index: true

      t.timestamps
    end
  end
end
