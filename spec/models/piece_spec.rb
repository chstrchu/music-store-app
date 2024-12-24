require 'rails_helper'

RSpec.describe 'Piece', type: :model do
  context 'composer scope' do
    let!(:vivaldi_piece) { Piece.create!(name: "Vivaldi comp", "composer": "Vivaldi") }
    let!(:bach_piece) { Piece.create!(name: "Bach comp", "composer": "Bach") }

    it 'scopes results by given composer' do
      result = Piece.by_composer("Bach")
      expect(result.count).to eq(1)
      expect(result.last.composer).to eq("Bach")
    end
  end

  context 'form scope' do
    let!(:vivaldi_sonata) { Piece.create!(name: "Vivaldi comp", form: "sonata", "composer": "Vivaldi") }
    let!(:vivaldi_concerto) { Piece.create!(name: "Vivaldi comp", form: "concerto", "composer": "Vivaldi") }

    it 'scopes results by given form' do
      result = Piece.by_form("sonata")
      expect(result.count).to eq(1)
      expect(result.first.form).to eq("sonata")
    end
  end
end
