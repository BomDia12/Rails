class Album < ApplicationRecord
  belongs_to :musician
  has_many :songs
end
