class Album < ApplicationRecord
  belongs_to :musician
  has_many :songs

  validates :name, presence: true
  validates :musician_id, presence: true
end
