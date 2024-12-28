require 'rails_helper'
RSpec.describe ScoreCreationJob, type: :job do
   context 'when a score already exists' do
     let!(:piece) { create(:piece) }
     let!(:score) do
       create(:score, piece_id: piece.id, name: piece.name,
              composer: piece.composer, publisher: 'IMC',
              instrument: 'violin')
     end

     let(:subject) { described_class.new.perform(name: score.name, composer: score.composer, publisher: score.publisher, instrument: score.instrument) }

     it 'does not create another score' do
       expect { subject }.not_to change { Score.count }
     end
   end


   context 'when score does not exist yet' do
     let(:params) do
       {
         name: 'Symphony No. 3 (Eroica)',
         composer: 'Ludwig van Beethoven',
         publisher: 'Barenreiter',
         instrument: 'Orchestra'
       }
     end

     let(:subject) { described_class.new.perform(name: params[:name], composer: params[:composer], publisher: params[:publisher], instrument: params[:instrument]) }

     it 'creates score and piece records as necessary' do
       subject
       piece = Piece.last
       score = Score.last

       expect([piece.name, piece.composer]).to match_array(['Symphony No. 3 (Eroica)', 'Ludwig van Beethoven'])
       expect([score.name, score.composer, score.publisher]).to match_array(['Symphony No. 3 (Eroica)', 'Ludwig van Beethoven', 'Barenreiter'])
     end
   end
end
