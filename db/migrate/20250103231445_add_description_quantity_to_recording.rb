class AddDescriptionQuantityToRecording < ActiveRecord::Migration[7.2]
  def change
    add_column :recordings, :description, :text
    add_column :recordings, :quantity, :integer, :default => 0

    add_index :recordings, :quantity
  end
end
