class ChangePieceCompositionYearType < ActiveRecord::Migration[7.2]
  def change
    change_column :pieces, :composition_year, :string
  end
end
