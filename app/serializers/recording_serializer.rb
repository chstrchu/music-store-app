class RecordingSerializer < ActiveModel::Serializer
  attributes :name, :release_date, :quantity
  has_many :pieces
  has_many :artists
end
