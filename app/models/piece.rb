class Piece < ApplicationRecord
  scope :by_composer, -> (composer) { where(composer: composer) if composer.present? }
  scope :by_key, -> (key) { where(key: key) if key.present? }
  scope :by_form, -> (form) { where(form: form) if form.present? }
  scope :composed_after, -> (year) { where("composition_year > ?", year) if year.present? }
  scope :composed_before, -> (year) { where("composition_year < ?", year) if year.present? }
end
