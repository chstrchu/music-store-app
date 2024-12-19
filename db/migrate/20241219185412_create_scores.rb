class CreateScores < ActiveRecord::Migration[7.2]
  def change
    create_table :scores do |t|
      t.string :name, index: true
      t.string :composer, index: true
      t.string :publisher, index: true
      t.string :instrument, index: true
      t.integer :page_count

      t.timestamps
    end
  end
end
