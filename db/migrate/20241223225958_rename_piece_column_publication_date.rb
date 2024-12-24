class RenamePieceColumnPublicationDate < ActiveRecord::Migration[7.2]
  def change
    rename_column :pieces, :publication_date, :composition_year
  end
end
