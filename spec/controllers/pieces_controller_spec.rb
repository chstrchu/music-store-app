require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe "GET index" do
    subject { get :index }

    context 'when sort parameters are passed' do
      let(:params) do
        {
          sort_by: {
            'composer': 'asc',
            'composition_year': 'desc'
          }
        }
      end

      let!(:piece1) { create(:piece, composer: 'Vivaldi', composition_year: '1715') }
      let!(:piece2) { create(:piece, composer: 'Vivaldi', composition_year: '1717') }
      let!(:piece3) { create(:piece, composer: 'Beethoven', composition_year: '1800') }
      let!(:piece4) { create(:piece, composer: 'Beethoven', composition_year: '1804') }

      subject do
        get :index, params: params
      end

      it 'sorts results based on parameters passed' do
        result = JSON.parse(subject.body)
        expect(result.map { |hsh| hsh['id'] }).to match_array([piece4.id, piece3.id, piece2.id, piece1.id])
      end
    end
  end
end
