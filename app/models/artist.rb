class Artist < ApplicationRecord
  has_and_belongs_to_many :recordings
end

