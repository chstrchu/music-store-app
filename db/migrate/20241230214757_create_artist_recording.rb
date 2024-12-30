class CreateArtistRecording < ActiveRecord::Migration[7.2]
  def change
    create_table :artist_recordings, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :recording, index: true

      t.timestamps
    end
  end
end
