require 'rails_helper'

RSpec.describe 'Piece', type: :model do
  context 'composer scope' do
    let!(:vivaldi_piece) { Piece.create!(name: "Vivaldi comp", "composer": "Vivaldi") }
    let!(:bach_piece) { Piece.create!(name: "Bach comp", "composer": "Bach") }

    it 'scopes results by given composer' do
      expect(Piece.with_composer("Bach").count).to eq(1)
      expect(Piece.with_composer("Bach").last.composer).to eq("Bach")
    end
  end
end
