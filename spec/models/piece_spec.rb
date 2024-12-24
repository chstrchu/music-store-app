require 'rails_helper'

RSpec.describe 'Piece', type: :model do
  context 'composer scope' do
    let!(:vivaldi_piece) { create(:piece, "composer": "Vivaldi") }
    let!(:bach_piece) { create(:piece, "composer": "Bach") }

    it 'scopes results by given composer' do
      result = Piece.by_composer("Bach")
      expect(result.count).to eq(1)
      expect(result.last.composer).to eq("Bach")
    end
  end

  context 'form scope' do
    let!(:sonata) { Piece.create!(form: "sonata") }
    let!(:concerto) { Piece.create!(form: "concerto") }

    it 'scopes results by given form' do
      result = Piece.by_form("sonata")
      expect(result.count).to eq(1)
      expect(result.first.form).to eq("sonata")
    end
  end
end
