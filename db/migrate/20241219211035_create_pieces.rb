class CreatePieces < ActiveRecord::Migration[7.2]
  def change
    create_table :pieces do |t|
      t.string :name, index: true
      t.string :composer, index: true
      t.date :publication_date
      t.string :form, index: true
      t.string :key

      t.timestamps
    end
  end
end
