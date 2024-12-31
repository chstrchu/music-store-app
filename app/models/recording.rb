class Recording < ApplicationRecord
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :pieces

  scope :by_name, -> (name) { where(name: name) if name.present? }
  scope :by_piece_name, -> (piece_name) { Recording.includes(:pieces).where("pieces.name LIKE ?", "%#{piece_name}%").references(:pieces) if piece_name.present? }
  scope :by_composer, -> (composer_name) { Recording.includes(:pieces).where("pieces.composer LIKE ?", "%#{composer_name}%").references(:pieces) if composer_name.present? }
  scope :by_artist_name, -> (artist_name) { Recording.includes(:artists).where("artists.name LIKE ?", "%#{artist_name}%").references(:artists) if artist_name.present? }
end
