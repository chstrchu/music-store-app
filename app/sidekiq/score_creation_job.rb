class ScoreCreationJob
  include Sidekiq::Job

  def perform(name:, publisher:, composer:, instrument:)
    score_exists = Score.where(name: name,
                               publisher: publisher,
                               composer: composer,
                               instrument: instrument).any?
    return if score_exists
    piece = create_piece(name, composer)
    Score.create!(piece_id: piece.id, name: name, publisher: publisher, composer: composer, instrument: instrument)
  end

  private

  def create_piece(name, composer)
    return if Piece.where(name: name, composer: composer).any?
    Piece.create!(name: name, composer: composer)
  end
end
