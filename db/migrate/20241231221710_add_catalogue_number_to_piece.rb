class AddCatalogueNumberToPiece < ActiveRecord::Migration[7.2]
  def change
    add_column :pieces, :catalogue_num, :string
  end
end
