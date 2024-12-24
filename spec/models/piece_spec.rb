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
    let!(:sonata) { create(:piece, form: "sonata") }
    let!(:concerto) { create(:piece, form: "concerto") }

    it 'scopes results by given form' do
      result = Piece.by_form("sonata")
      expect(result.count).to eq(1)
      expect(result.first.form).to eq("sonata")
    end
  end

  context 'dates filter' do
    let!(:early_piece) { create(:piece, composition_year: "1700") }
    let!(:mid_piece) { create(:piece, composition_year: "1800") }
    let!(:late_piece) { create(:piece, composition_year: "1900") }

    it 'returns early piece when given before filter' do
      result = Piece.composed_before("1750")
      expect(result.count).to eq(1)
      expect(result.first.composition_year).to eq("1700")
    end

    it 'returns late piece when given after filter' do
      result = Piece.composed_after("1850")
      expect(result.count).to eq(1)
      expect(result.first.composition_year).to eq("1900")
    end

    it 'returns middle piece when given before and after filter' do
      result = Piece.composed_before("1900").composed_after("1700")
      expect(result.count).to eq(1)
      expect(result.first.composition_year).to eq("1800")
    end
  end
end
