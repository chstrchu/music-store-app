class Piece < ApplicationRecord
  scope :with_composer, -> (composer) { where(composer: composer) }
end
