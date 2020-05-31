class Song < ApplicationRecord
  belongs_to :album
  belongs_to :musical_gender

  validates :name, presence: true
  validates :album_id, presence: true
  validates :musical_gender_id, presence: true
end
