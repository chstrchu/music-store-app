class Recording < ApplicationRecord
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :pieces

  scope :by_name, -> (name) { where(name: name) if name.present? }
  scope :by_piece_name, -> (piece_name) { Recording.joins(:pieces).where("pieces.name LIKE ?", "%#{piece_name}%") if piece_name.present? }
  scope :by_artist_name, -> (artist_name) { Recording.joins(:artists).where("artists.name LIKE ?", "%#{artist_name}%") if artist_name.present? }
end
