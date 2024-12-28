class RecordingSerializer < ActiveModel::Serializer
  attributes :name, :release_date
  has_many :pieces
end
